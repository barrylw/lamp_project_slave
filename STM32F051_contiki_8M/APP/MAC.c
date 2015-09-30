/*����������������������������������������������������
* �� �� ����MAC.c  
* ��    �ߣ�����
* ��    �ڣ�2014-04-06
* �ļ�˵����MAC�����ļ�
*����������������������������������������������������*/
#include "MAC.h"


/***************MAC�����***************/
sMacAttr     MacAttr;               //MAC������
sMacRecv     MacRecv;               //MAC���������
sMacSend     MacSend;               //MAC�㷢������
sMacCommAttr MacCommAttr;           //MAC�㹫������
sMacNIDList  MacNIDList;            //MAC��NID�����б� 

MACATTRIBUTE MacAttribute;

/***************MAC�����***************/


/***************MAC���ⲿ����***************/
//sDiskMacDisk;//MAC��DISK
//sSatTableMacSat;//MAC��SAT��
//extern timeregs TimeRegs;
/***************MAC���ⲿ����***************/


/***************MAC�㺯��***************/
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
/***************MAC�㺯��***************/

ST_EVENT_CONTROL mac_transmitEvent = {0xFF, 0};
ST_EVENT_CONTROL mac_receiveEvent  = {0xFF, 0};
ST_EVENT_CONTROL mac_alignedSlotEvent  = {0xFF, 0};


ST_EVENT_METHOD mac_events[] =
{
  {&mac_transmitEvent, NULL},
  {&mac_receiveEvent, NULL},
  {&mac_alignedSlotEvent, NULL},
};



/***************MAC���ʼ��***************/

/*����������������������������������������������������
* �� �� ����Mac_Init  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC���ʼ��
*����������������������������������������������������*/
void Mac_Init(void)
{
    //��ʼ��
    Mac_Vari_Init();

    //NID�����б��ʼ��
    Mac_NIDList_Init();

    MACDBG(printf("MAC: ��ʼ�����\r\n"););

    return;
}

/*����������������������������������������������������
* �� �� ����Mac_Vari_Init  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC����س�ʼ��
*����������������������������������������������������*/
static void Mac_Vari_Init(void)
{
    u16 NID = 0;
    
    #if 0
    //��ȡNID
    if (IFlash_Read(IFLASH_TABLEID_MAC,NIDFiledIndex,(u8 *)&NID,2))
    {
        //��ʼ��NID
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

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Init  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC��NID�����б��ʼ��
*����������������������������������������������������*/
static void Mac_NIDList_Init(void)
{
#if 0
    u8  VSS[MacVSSSize] = {0};
    u16 len = MacVSSSize;

    MacDisk.StaBlock = FLASH_BLOCKID_MACSTA;
    MacDisk.EndBlock = FLASH_BLOCKID_MACEND;
    MacDisk.SectorNum =1;
    MacDisk.SectorSize = MacVSSSize;

    //���̳�ʼ��
    Disk_Init(&MacDisk,&MacSat);

    if(MacSat.UseFlag)
    {
        if(VSS_Read(&MacDisk,1,VSS,0,&len) != RET_VSS_SUCCESS)
        {
            MACDBG(printf("MAC: ����1����\r\n"););
            return;
        }

    MemCpy(&MacNIDList,VSS,sizeof(sMacNIDList));
    }

    MACDBG(printf("MAC: NID�����б� ����%d ��ǰ�������%d\r\n",MacNIDList.NIDCount,MacNIDList.NIDIndex););

    return;
#endif
}

/*����������������������������������������������������
* �� �� ����Mac_Para_Init  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC�������ʼ��
*����������������������������������������������������*/
void Mac_Para_Init(void)
{
    u16 NID;

    MACDBG(printf("MAC: ������ʼ��\r\n"););

    NID = Mac_NID_Change(MacCommAttr.mac_NID);

    MACDBG(printf("MAC: ��NIDΪ0x%04x ��NIDΪ0x%04x\r\n",MacCommAttr.mac_NID,NID););

    IFlash_Write(IFLASH_TABLEID_MAC,NIDFiledIndex,(u8 *)&NID,2);

    //ͳһ��APS����FLASH
    //Mac_NIDList_Clear();

    Mac_Init();

    return;
}

/***************MAC���ʼ��***************/


/***************MAC����������***************/

/*����������������������������������������������������
* �� �� ����Mac_Proc  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC����������
*����������������������������������������������������*/
void Mac_Proc(void)
{
    //��������
    Disk_Proc(&MacDisk);
    //MAC����
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
                     MacSend.send_CCA_delay  = GetRand(1,MacAttr.mac_BE); //���ǽ���CCA��ʱ
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
                        /* �ȴ�ʱ϶���� */
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
                                //  ����˱ܴ�����������ô����ֱ�ӷ��������´��ٷ������Ƕ�����
                                mac_transmitEvent.startoption = END; 
                            }
                            else
                            {   
                                mac_transmitEvent.startoption = WAIT; 
                                MacSend.send_sub_status = SEND_SUB_STATUS_CSMA;
                                MacSend.send_CCA_delay  = GetRand(1,MacAttr.mac_BE); //���ǽ���CSMA-CCA��ʱ
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




/***************MAC����������***************/


/***************MAC��������***************/

/*����������������������������������������������������
* �� �� ����Mac_GetAttr  
* ���������attr������
attrlen���Գ���
* ���������val����ֵ
* �� �� ֵ��0�ɹ�
2���Գ��ȴ���
3��֧��������
* ����˵����MAC���ȡ����
*����������������������������������������������������*/
u8 Mac_GetAttr(u8 attr,u8 attrlen,u8* val)
{
}

/*����������������������������������������������������
* �� �� ����Mac_SetAttr  
* ���������attr������
attrlen���Գ���
val����ֵ
* ���������None
* �� �� ֵ��0�ɹ�
2���Գ��ȴ���
3��֧��������
* ����˵����MAC����������
*����������������������������������������������������*/
u8 Mac_SetAttr(u8 attr,u8 attrlen,u8* val)
{
}

/***************MAC��������***************/

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
        //ȫ��
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
/***************MAC�����ݷ���ӿ�***************/


/***************MAC���ڲ�����***************/


/*����������������������������������������������������
* �� �� ����Mac_Judge_NID  
* ���������buff���ݻ�����
* ���������None
* �� �� ֵ��0��ƥ��
1ƥ��
* ����˵����MAC���ж�NID
*����������������������������������������������������*/
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
            MACDBG(printf("MAC: NID��ƥ��\r\n"););
            return NotMatch;
        }
    }
}

/*����������������������������������������������������
* �� �� ����Mac_Judge_Addr  
* ���������buff���ݻ�����
* ���������None
* �� �� ֵ��0��ƥ��
1ƥ��
* ����˵����MAC���ж�֡��ַ
*����������������������������������������������������*/
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



/*����������������������������������������������������
* �� �� ����Mac_NID_Change  
* ���������nid�޸�ǰ��NID
* ���������None
* �� �� ֵ��nid�޸ĺ��NID
* ����˵����MAC���޸�NID
*����������������������������������������������������*/
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

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Add  
* ���������nid��NID
* ���������None
* �� �� ֵ��None
* ����˵����MAC������NID�����б�
*����������������������������������������������������*/
static void Mac_NIDList_Add(u16 nid)
{
    //�����Ƿ����
    if(Mac_NIDList_Check(nid))
    {
        //����������
        MacNIDList.NIDFlag = 0;
    }
    else
    {
        //������������
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
        //�ø��±�־
        MacNIDList.NIDFlag = 1;
    }

    return;
}

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Update  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC�����NID�����б�
*����������������������������������������������������*/
static void Mac_NIDList_Update(void)
{
    VSS_Write(&MacDisk,1,(u8*)&MacNIDList,0,sizeof(sMacNIDList));

    return;
}

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Check  
* ���������nidNID
* ���������None
* �� �� ֵ��1����
0������
* ����˵����MAC����NID�����б��Ƿ���ڸ�NID
*����������������������������������������������������*/
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

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Clear  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC�����NID�����б�
*����������������������������������������������������*/
void Mac_NIDList_Clear(void)
{
    Disk_Erase(&MacDisk);

    return;
}

/*����������������������������������������������������
* �� �� ����Mac_NIDList_Print  
* ���������None
* ���������None
* �� �� ֵ��None
* ����˵����MAC���ӡNID�����б�
*����������������������������������������������������*/
void Mac_NIDList_Print(void)
{
    u8 i;

    DISP(printf("MAC: NID�����б� ����%d ��ǰ�������%d\r\n",MacNIDList.NIDCount,MacNIDList.NIDIndex););

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


/***************MAC���ڲ�����***************/
