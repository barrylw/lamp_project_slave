/*——————————————————————————
* 文 件 名：MAC.c  
* 作    者：邹亮
* 日    期：2014-04-06
* 文件说明：MAC层主文件
*——————————————————————————*/
#include "MAC.h"


/***************MAC层变量***************/
sMacAttr     MacAttr;               //MAC层属性
sMacRecv     MacRecv;               //MAC层接收数据
sMacSend     MacSend;               //MAC层发送数据
sMacCommAttr MacCommAttr;           //MAC层公共属性
sMacNIDList  MacNIDList;            //MAC层NID侦听列表 

MACATTRIBUTE MacAttribute;

/***************MAC层变量***************/


/***************MAC层外部变量***************/
//sDiskMacDisk;//MAC层DISK
//sSatTableMacSat;//MAC层SAT表
//extern timeregs TimeRegs;
/***************MAC层外部变量***************/


/***************MAC层函数***************/
static void Mac_Vari_Init(void);
static void Mac_Tick(void);
static u8   Mac_Judge_Protocol(void);
static u8   Mac_Judge_Addr(u8* buff);
static u8   Mac_Judge_NID(u8* buff);
static u8   Mac_Send(u8 handle,u8 frametype,u8 txoptions);
static u16  Mac_NID_Change(u16 nid);
static void Mac_NIDList_Init(void);
static void Mac_NIDList_Add(u16 nid);
static void Mac_NIDList_Update(void);
static u8   Mac_NIDList_Check(u16 nid);
/***************MAC层函数***************/

ST_EVENT_CONTROL mac_transmitEvent = {0xFF, 0};
ST_EVENT_CONTROL mac_receiveEvent  = {0xFF, 0};
ST_EVENT_CONTROL mac_alignedSlotEvent  = {0xFF, 0};


ST_EVENT_METHOD mac_events[] =
{
  {&mac_transmitEvent, NULL},
  {&mac_receiveEvent, NULL},
  {&mac_alignedSlotEvent, NULL},
};



/***************MAC层初始化***************/

/*——————————————————————————
* 函 数 名：Mac_Init  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层初始化
*——————————————————————————*/
void Mac_Init(void)
{
    //初始化
    Mac_Vari_Init();

    //NID侦听列表初始化
    Mac_NIDList_Init();

    MACDBG(printf("MAC: 初始化完成\r\n"););

    return;
}

/*——————————————————————————
* 函 数 名：Mac_Vari_Init  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层相关初始化
*——————————————————————————*/
static void Mac_Vari_Init(void)
{
    u16 NID = 0;
    
    #if 0
    //获取NID
    if (IFlash_Read(IFLASH_TABLEID_MAC,NIDFiledIndex,(u8 *)&NID,2))
    {
        //初始化NID
        NID = IFlash_GetDeviceID();

        IFlash_Write(IFLASH_TABLEID_MAC,NIDFiledIndex,(u8 *)&NID,2);
    }
    #endif

    MemSet((u8 *)&MacCommAttr,0,sizeof(sMacCommAttr));
    MemSet((u8 *)&MacNIDList,0,sizeof(sMacNIDList));
    MemSet((u8 *)&MacAttr,0,sizeof(sMacAttr));
    MemSet((u8 *)&MacRecv,0,sizeof(sMacRecv));
    MemSet((u8 *)&MacSend,0,sizeof(sMacSend));

    MacAttr.mac_SEQ = 0;
    MacCommAttr.mac_NID = NID;

    return;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Init  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层NID侦听列表初始化
*——————————————————————————*/
static void Mac_NIDList_Init(void)
{
#if 0
    u8  VSS[MacVSSSize] = {0};
    u16 len = MacVSSSize;

    MacDisk.StaBlock = FLASH_BLOCKID_MACSTA;
    MacDisk.EndBlock = FLASH_BLOCKID_MACEND;
    MacDisk.SectorNum =1;
    MacDisk.SectorSize = MacVSSSize;

    //磁盘初始化
    Disk_Init(&MacDisk,&MacSat);

    if(MacSat.UseFlag)
    {
        if(VSS_Read(&MacDisk,1,VSS,0,&len) != RET_VSS_SUCCESS)
        {
            MACDBG(printf("MAC: 扇区1错误\r\n"););
            return;
        }

    MemCpy(&MacNIDList,VSS,sizeof(sMacNIDList));
    }

    MACDBG(printf("MAC: NID侦听列表 总数%d 当前更新序号%d\r\n",MacNIDList.NIDCount,MacNIDList.NIDIndex););

    return;
#endif
}

/*——————————————————————————
* 函 数 名：Mac_Para_Init  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层参数初始化
*——————————————————————————*/
void Mac_Para_Init(void)
{
    u16 NID;

    MACDBG(printf("MAC: 参数初始化\r\n"););

    NID = Mac_NID_Change(MacCommAttr.mac_NID);

    MACDBG(printf("MAC: 旧NID为0x%04x 新NID为0x%04x\r\n",MacCommAttr.mac_NID,NID););

    IFlash_Write(IFLASH_TABLEID_MAC,NIDFiledIndex,(u8 *)&NID,2);

    //统一由APS擦除FLASH
    //Mac_NIDList_Clear();

    Mac_Init();

    return;
}

/***************MAC层初始化***************/


/***************MAC层周期任务***************/

/*——————————————————————————
* 函 数 名：Mac_Proc  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层周期任务
*——————————————————————————*/
void Mac_Proc(void)
{
    //扇区任务
    Disk_Proc(&MacDisk);
    //MAC任务
    Mac_Tick();

    return;
}



void hal_RunMacEvents(ST_EVENT_METHOD *pEvents)
{
    u8 eventNum = 0;
    u8 eventCnt = 0;
    u8 tempCCAResult;
    u8 tempPHYStatus;
    eventNum = sizeof(RFEvents) / sizeof(ST_EVENT_METHOD);

    for (eventCnt = 0; eventCnt < eventNum; eventCnt++)
    {
        if (eventCnt == 0)
        {
            switch (pEvents[eventCnt].control->startoption)
            {
                case START:
                if ((MacSend.send_sub_status == SEND_SUB_STATUS_CSMA) & (MacAttribute.mac_CF_period == 0)) 
                {
                     mac_transmitEvent.startoption = WAIT; 
                     MacAttr.mac_NB++;
                     MacSend.send_CCA_delay  = GetRand(1,MacAttr.mac_BE); //就是进行CCA延时
                     pEvents[eventCnt].control->timeToExecute = MacSend.send_CCA_delay * TIME_SLOT_LENGTH + hal_GetSystickCounter();
                 }
                 else if (MacSend.send_sub_status ==  SEND_SUB_STATUS_STOPRELAY)
                 {
                     PD_DATA_Request(MacSend.send_buf_len, MacSend.send_buf, 0);
                 }
               
                break;

                case WAIT:
                   if (pEvents[eventCnt].control->timeToExecute < hal_GetSystickCounter())
                   {
                        /* 等待时隙对齐 */
                        MacSend.send_sub_status = SEND_SUB_STATUS_WAIT;
                        mac_transmitEvent.startoption = FINISH; 
                   }
                break;

                case FINISH:
                if (MacSend.send_sub_status == SEND_SUB_STATUS_WAIT)
                {
                }
                else if (MacSend.send_sub_status == SEND_SUB_STATUS_CS)
                {
                    if (get_CCA_result(tempCCAResult) == 0)
                    {
                        if (tempCCAResult == PHY_BUSY)
                        {
                            MacAttr.mac_NB++;
                            if (MacAttr.mac_NB >= MaxNB)
                            {
                                //  最大退避次数到来，怎么处理，直接发，还是下次再发。还是丢掉。
                                mac_transmitEvent.startoption = END; 
                            }
                            else
                            {   
                                mac_transmitEvent.startoption = WAIT; 
                                MacSend.send_sub_status = SEND_SUB_STATUS_CSMA;
                                MacSend.send_CCA_delay  = GetRand(1,MacAttr.mac_BE); //就是进行CSMA-CCA延时
                                pEvents[eventCnt].control->timeToExecute = MacSend.send_CCA_delay * TIME_SLOT_LENTH;
                            }
                        }
                        else
                        {
                            mac_transmitEvent.startoption = END;
                            PD_DATA_Request(MacSend.send_buf_len, MacSend.send_buf,  0);
                        }
                    }
                }
                break;

                case END:
                break;

                default:
                break;
               
            }
        }
        else if (eventCnt == 1)
        {
            if (Phy_RxData())
            {
                mac_alignedSlotEvent.startoption = START;
                PD_DATA_Indication(&MacRecv.mac_recv_buf_len, MacRecv.mac_recv_buf, &MacRecv.mac_recv_rssi);
            }
          
        }
        else if (eventCnt == 2)
        {
            switch (pEvents[eventCnt].control->startoption)
            {
                case START:
                    MacAttribute.mac_CF_period  =   TIME_CFP_LENGTH;
                    mac_alignedSlotEvent.startoption = WAIT;
                    pEvents[eventCnt].control->timeToExecute = MacAttribute.mac_CF_period + hal_GetSystickCounter();
                break;

                case WAIT:
                    if (pEvents[eventCnt].control->timeToExecute < hal_GetSystickCounter())
                    {
                       if (MacAttribute.mac_CF_period == 0)
                       {
                            if (MacSend.send_sub_status == SEND_SUB_STATUS_WAIT)
                            {
                                PLME_CCA_Request(0);
                                MacSend.send_sub_status = SEND_SUB_STATUS_CS;
                            }
                       }
                       else
                       {
                            MacAttribute.mac_CF_period = 0;
                       }
                       pEvents[eventCnt].control->timeToExecute = hal_GetSystickCounter() + TIME_SLOT_LENGTH;
                    }
                    
                break;

                case FINISH:
                break;

                case END:
                break;

                default:
                break;
            }
        }
    }
}




/***************MAC层周期任务***************/


/***************MAC层管理服务***************/

/*——————————————————————————
* 函 数 名：Mac_GetAttr  
* 输入参数：attr属性名
attrlen属性长度
* 输出参数：val属性值
* 返 回 值：0成功
2属性长度错误
3不支持属性名
* 功能说明：MAC层获取属性
*——————————————————————————*/
u8 Mac_GetAttr(u8 attr,u8 attrlen,u8* val)
{
}

/*——————————————————————————
* 函 数 名：Mac_SetAttr  
* 输入参数：attr属性名
attrlen属性长度
val属性值
* 输出参数：None
* 返 回 值：0成功
2属性长度错误
3不支持属性名
* 功能说明：MAC层设置属性
*——————————————————————————*/
u8 Mac_SetAttr(u8 attr,u8 attrlen,u8* val)
{
}

/***************MAC层管理服务***************/

u8 Mac_StopRelay_Request(u8 handle,u8 life_perild,u8 flag)
{
    u8  tempPHYStatus;
    u16 tempNid;

    if(life_perild > 0x3)
    {
        life_perild = 3;
    }

      if (flag)
    {
        //全网
        tempNid->nid = BroadNID;
    }
    else
    {
        tempNid->nid = MacAttribute.mac_net_ID;
    }
    
    MacSend.send_buf[0] = MAC_FRAME_STOPRELAY;
    MacSend.send_buf[1] = (u8)(MacAttribute.mac_net_ID  & 0xFF);
    MacSend.send_buf[2] = (u8)((MacAttribute.mac_net_ID >> 8)  & 0xFF);
    MacSend.send_buf[3] = life_perild;
    MacSend.send_buf_len = 4;
    
    Phy_GetAttr(PHYSTATUS, &tempPHYStatus);

    if (tempPHYStatus == PHY_IDLE)
    {
        PD_DATA_Request(MacSend.send_buf_len, MacSend.send_buf, 0);
    }
    else if (tempPHYStatus == PHY_BUSY)
    {
        MacSend.send_sub_status = SEND_SUB_STATUS_STOPRELAY;
        mac_transmitEvent.startoption = START;   
    }
    
}


u8 MD_STOP_RELAY_Indication()
{
}

u8 MD_data_Indication()
{
}


u8 Mac_Data_Request(u8 handle,u8 addrtype,u8* destaddr,u16 msdulen,u8* msdu,u8 txoptions)
{
    st_MacFrame mac_frame;

    u8 mac_frame_ctrl_length = sizeof(mac_frame.mac_ctrl);

    u8 s_addrLength = 0;
    u8 d_addrLength = 0;

    mac_frame.mac_ctrl.macFrameType                 = MAC_FRAME_DATA;
    mac_frame.mac_ctrl.macSafty                     = 0;
    mac_frame.mac_ctrl.macACK                       = txoptions;
    mac_frame.mac_ctrl.macSourceAddrType            = (addrtype & 0x01);
    mac_frame.mac_ctrl.macDestAddrType              = ((addrtype >> 1) & 0x01);
    mac_frame.mac_ctrl.macReseved                   = 0;
    mac_frame.st_frame_ctrl.macProtocolVersion      = 0;

    memcpy(MacSend.send_buf, (u8)(&(mac_frame.mac_ctrl)), mac_frame_ctrl_length);

    
    mac_frame.mac_dsn               = MacCommAttr.mac_DSN++;
    mac_frame.nid                   = MacCommAttr.mac_NID;

    if (mac_frame.macSourceAddrType == 0)
    {
        mac_frame.macSourceAddr =  MacCommAttr.nodeMacAddr.shortAddr;
    }
    else
    {
        mac_frame.macSourceAddr = MacCommAttr.nodeMacAddr.longAddr;
    }
    mac_frame.macDestAddr           = destaddr;
    mac_frame.macData               = msdu;
    
   /*********************************************************/
   MacSend.send_buf[mac_frame_ctrl_length]   =   mac_frame.mac_dsn;
   MacSend.send_buf[mac_frame_ctrl_length+1] =  (u8)(mac_frame.nid >> 8);
   MacSend.send_buf[mac_frame_ctrl_length+2] =  (u8)(mac_frame.nid);
   
   s_addrLength = (mac_frame.mac_ctrl.macSourceAddrType == 0)?2:6;
   memcpy(MacSend.send_buf[mac_frame_ctrl_length+3],  mac_frame.macSourceAddr, s_addrLength);
   
   d_addrLength = (mac_frame.mac_ctrl.macDestAddrType == 0)?2:6;
   memcpy(MacSend.send_buf[mac_frame_ctrl_length+3+s_addrLength],  mac_frame.macSourceAddr, d_addrLength);

   memcpy(MacSend.send_buf[mac_frame_ctrl_length+3+s_addrLength+d_addrLength], msdu, msdulen);
   /*********************************************************/

   MacSend.send_buf_len = mac_frame_ctrl_length+3+s_addrLength+d_addrLength + 1;
   MacAttr.mac_NB = 0;
   MacAttr.mac_BE = MinBE;
   MacSend.send_sub_status = SEND_SUB_STATUS_CSMA;
   mac_transmitEvent.startoption = START;   
}
/***************MAC层数据服务接口***************/


/***************MAC层内部处理***************/


/*——————————————————————————
* 函 数 名：Mac_Judge_NID  
* 输入参数：buff数据缓冲区
* 输出参数：None
* 返 回 值：0不匹配
1匹配
* 功能说明：MAC层判断NID
*——————————————————————————*/
static u8 Mac_Judge_NID(u8* buff)
{
    sMacBeaconFrame* macbeaconframe = (sMacBeaconFrame *)buff;
    sMacStopRelayFrame* macstoprelayframe = (sMacStopRelayFrame *)buff;

    if(MAC_FRAME_STOPRELAY == macbeaconframe->framecontrol.frame_type)
    {
        if((BroadNID == macstoprelayframe->nid) || (macstoprelayframe->nid == MacCommAttr.mac_NID))
        {
            return Match;
        }
        else
        {
            return NotMatch;
        }
    }
    else
    {
        if((BroadNID == macbeaconframe->nid) || (macbeaconframe->nid == MacCommAttr.mac_NID))
        {
            return Match;
        }
        else
        {
            MACDBG(printf("MAC: NID不匹配\r\n"););
            return NotMatch;
        }
    }
}

/*——————————————————————————
* 函 数 名：Mac_Judge_Addr  
* 输入参数：buff数据缓冲区
* 输出参数：None
* 返 回 值：0不匹配
1匹配
* 功能说明：MAC层判断帧地址
*——————————————————————————*/
static u8 Mac_Judge_Addr(u8* buff)
{
sMacFrameControl* mac_frame = (sMacFrameControl *)buff;
u8* finger = buff;

if(MAC_FRAME_STOPRELAY == mac_frame->frame_type)
{
return NotMatch;
}

finger += 3;
finger += 2;

if(mac_frame->addr_type)
{
finger += 2;
}
else
{
finger += 6;
}

if(mac_frame->dstaddr_type)
{
u16 dstaddr = 0;
MemCpy(&dstaddr,finger,2);
if((dstaddr == BroadAimAddr) || (dstaddr == 0))
{
return Match;
}
}
else
{
return Match;
}

return NotMatch;       
}



/*——————————————————————————
* 函 数 名：Mac_NID_Change  
* 输入参数：nid修改前的NID
* 输出参数：None
* 返 回 值：nid修改后的NID
* 功能说明：MAC层修改NID
*——————————————————————————*/
static u16 Mac_NID_Change(u16 nid)
{
    u8 j;

    for (j=0;j<MaxNIDCount;j++)
    {
        nid ++ ;

        if (Mac_NIDList_Check(nid))
        {
            continue;
        }
        else
        {
            return nid;
        }
    }

    nid ++ ;

    return nid;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Add  
* 输入参数：nid新NID
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层增加NID侦听列表
*——————————————————————————*/
static void Mac_NIDList_Add(u16 nid)
{
    //查找是否存在
    if(Mac_NIDList_Check(nid))
    {
        //存在则不增加
        MacNIDList.NIDFlag = 0;
    }
    else
    {
        //不存在则增加
        MacNIDList.NIDList[MacNIDList.NIDIndex] = nid;

        if (MacNIDList.NIDIndex == (MaxNIDCount - 1))
        {
            MacNIDList.NIDIndex = 0;
        }
        else
        {
            MacNIDList.NIDIndex ++;
        }

        if (MacNIDList.NIDCount < MaxNIDCount)
        {
            MacNIDList.NIDCount ++;
        }
        //置更新标志
        MacNIDList.NIDFlag = 1;
    }

    return;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Update  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层更新NID侦听列表
*——————————————————————————*/
static void Mac_NIDList_Update(void)
{
    VSS_Write(&MacDisk,1,(u8*)&MacNIDList,0,sizeof(sMacNIDList));

    return;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Check  
* 输入参数：nidNID
* 输出参数：None
* 返 回 值：1存在
0不存在
* 功能说明：MAC层检测NID侦听列表是否存在该NID
*——————————————————————————*/
static u8 Mac_NIDList_Check(u16 nid)
{
    u8 i;

    for (i=0;i<MacNIDList.NIDCount;i++)
    {
        if (nid == MacNIDList.NIDList[i])
        {
            return 1;
        }
    }

    return 0;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Clear  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层清空NID侦听列表
*——————————————————————————*/
void Mac_NIDList_Clear(void)
{
    Disk_Erase(&MacDisk);

    return;
}

/*——————————————————————————
* 函 数 名：Mac_NIDList_Print  
* 输入参数：None
* 输出参数：None
* 返 回 值：None
* 功能说明：MAC层打印NID侦听列表
*——————————————————————————*/
void Mac_NIDList_Print(void)
{
    u8 i;

    DISP(printf("MAC: NID侦听列表 总数%d 当前更新序号%d\r\n",MacNIDList.NIDCount,MacNIDList.NIDIndex););

    for (i=0;i<MacNIDList.NIDCount;i++)
    {
    DISP(printf("MAC: NID%d 0x%04x\r\n",i+1,MacNIDList.NIDList[i]););
    }

    return;
}


/*****************************************************************************
 Prototype    : Mac_CCA_Confirm
 Description  : 
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
void Mac_CCA_Confirm(PHY_STATUS status)
{
  switch(status)
  {
  case  PHY_IDLE:
        PHY_TRX_OFF:
        PHY_FORCE_TRX_OFF:
        PHY_SUCCESS:
    break;
    
  case  PHY_BUSY :
        PHY_BUSY_RX:
        PHY_BUSY_TX:
        PHY_RX_ON:
        PHY_TX_ON:
    break;
    
  default:
    break; 
  }
}


/***************MAC层内部处理***************/
