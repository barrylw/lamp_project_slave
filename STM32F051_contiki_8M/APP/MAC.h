/*——————————————————————————
* 文 件 名：MAC.h  
* 作    者：邹亮
* 日    期：2014-04-06
* 文件说明：MAC层头文件
*——————————————————————————*/
#ifndef _MAC_H
#define _MAC_H

#include "phy.h"

#pragma pack(1)

#ifdef __MACDEBUG
#define MACDBG(CODE) do{printf("%02d:%02d:%02d->", TimeRegs.hour, TimeRegs.minute, TimeRegs.second); CODE}while(0)
#else
#define MACDBG(CODE)
#endif

#define MacProtoVer                    1          //MAC层协议版本号
#define MaxMSDUSize                    238        //MAC帧载荷域最大字节数
#define MacBuffLen                     255        //(MaxMSDUSize+20)//MAC层最大缓冲区长度
#define MaxNB                          6          //CSMA-CA算法中的退让次数最大值
#define MaxBE                          10         //CSMA-CA算法中的退让指数最大值
#define MinBE                          3
#define MaxNIDCount                    20         //NID侦听列表最大数

#define BroadNID                       0xffff        //广播NID
#define BroadAimAddr                   0xffff        //广播目标地址

#define WaitSendMaxTime                500        //MAC层最大等待发送时间，5秒
#define SendingMaxTime                 400        //MAC层最大发送持续时间，4秒
#define ReadMaxTime                    300        //MAC层最大读取反馈时间，3秒

#define NotMatch                       0        //不匹配
#define Match                          1        //匹配

#define MacSendFailure                 0        //MAC层发送失败
#define MacSendSuccess                 1        //MAC层发送成功

#define IFLASH_TABLEID_MAC             FLASH_PARAMETER_ADDRESS
#define NIDFiledIndex                  0        //NID所对应表中序号
#define MacVSSSize                     50        //MAC层使用扇区大小

#define TIME_SLOT_LENGTH                15        //MS
#define TIME_CFP_LENGTH                 50

#if 0
//读取MAC层属性时的返回信息
typedef enum
{
    RET_MAC_SUCCESS,//返回成功
    RET_MAC_ATTRLEN_ERR,//属性长度错误
    RET_MAC_ATTR_NOEXIST,//属性名不存在
}eMacRet;

//发送选项
typedef enum
{
    OPTION_DEFAULT  = 0x00, //默认
    OPTION_ACK_READ = 0x01  //发送反馈标识   1 需要读取确认0 不需要读取确认
}eMacTxOption;

//帧类型
typedef enum
{
    //MAC_FRAME_BEACON,//信标帧
    MAC_FRAME_DATA,      //数据帧
    MAC_FRAME_ACK,       //应答帧
    MAC_FRAME_STOPRELAY, //停止转发帧
    MAC_FRAME_RESERVE    //预留
}eMacFrameType;

/* 为什么要搞发送状态和发送子状态 */
//发送状态
typedef enum
{
    SEND_STATUS_IDLE,//发送未完成
    SEND_STATUS_FINISH,//发送完成
    SEND_STATUS_START,//发送启动
    SEND_STATUS_TX_ING//发送中
}eMacSendStatus;

//发送子状态
typedef enum
{
    SEND_SUB_STATUS_TX,   //立即发送
    SEND_SUB_STATUS_CSMA, //检测信道
    SEND_SUB_STATUS_WAIT  //等待时隙
}eMacSendSubStatus;

/***************MAC层属性***************/
/* 属性类型，读取属性或设置属性时，switch-case*/
typedef enum 
{
    MACA_SEQ,           //帧序号属性r
    MACA_NB,            //CSMA-CA退让次数属性r/w
    MACA_BE,            //CSMA-CA退让指数属性r/w
    MACA_NID,           //NID属性r/w
    MACA_ADDR,          //长地址属性r/w
    MACA_ADDRTYPE,      //源地址类型属性r/w
    MACA_ALLNET,        //网络标识属性r/w
    MACA_SENDCONFIRM,   //发送确认属性r
    MACA_SENDRESULT     //发送结果属性r
}eMacAttr;

/* 为什么属性也要分两种 */
typedef struct
{
    u8  mac_SEQ;                  //帧序号
    u8  mac_NB;                   //CSMA-CA退让次数
    u8  mac_BE;                   //CSMA-CA退让指数
    u8  mac_AddrType;             //源地址类型  0 长地址 1 短地址
    u8  mac_AllNet;               //网络标识    0 本网   1   全网
}sMacAttr;

typedef struct
{
    u16 mac_NID;                  //NID
    u8  mac_Addr[6];              //长地址 短地址固定为0
}sMacCommAttr;
/***************MAC层属性***************/

//接收数据
typedef struct 
{
    u16 mac_recv_buf_len;        //接收帧数据长度
    u8 mac_recv_buf[MacBuffLen]; //接收帧数据缓存区
    u8 mac_recv_rssi;            //接收帧信号值
    u8 mac_recv_data_ready;      //是否接收到帧标识
    //u8 mac_recv_mode;          //接收帧模式        0x04,0x05,0x07,0x08分别是BPSK，QPSK，ENHANCE，鲁棒模式
}sMacRecv;

//发送数据
typedef struct
{
    //u8 stoprelay_handle;         //发送停止转发包句柄
    //u8 dataframe_handle;         //发送数据包句柄
    u8  follow_send_stoprelay;     //后续发送停止转发包
    u8  follow_send_dataframe;     //后续发送数据包
    u16 wait_read_time;            //等待读取超时时间
    u16 wait_send_time;            //等待启动发送时间
    u16 wait_send_ack_time;        //等待发送完成时间
    u8  send_ZCP;                  //发送沿是否匹配 1 匹配  ZCP zero crossing point
    u8  send_frame_type;           //发送的帧类型
    u8  send_status;               //发送状态
    u8  send_sub_status;           //发送子状态
    u8  send_result;               //发送结果
    u8  send_result_read;          //发送结果反馈  1 需要等待读取反馈结果 0 不需要等待读取反馈
    u8  send_mode;                 //发送模式
    u16 send_CCA_delay;            //发送CCA延时
    u16 send_buf_len;              //发送数据缓冲区长度
    u8  send_buf[MacBuffLen];      //发送数据缓冲区
    u8  stoprelay_len;             //停止转发缓冲区长度
    u8  stoprelay_buf[23];         //停止转发缓冲区 新协议4 旧协议23
}sMacSend;

//NID侦听列表
typedef struct 
{
    u8  NIDFlag;//NID更新标志
    u8  NIDCount;//NID计数器
    u8  NIDIndex;//NID更新序号
    u16 NIDList[MaxNIDCount];//NID清单
}sMacNIDList;

//帧控制域
typedef struct
{
    u16 mac_protocol_verison:4;//版本
    u16 reservation:4;//预留 
    u16 send_phase:2;//发送相位
    u16 dstaddr_type:1;//目标地址类型  
    u16 addr_type:1;//源地址类型
    u16 mac_ack:1;//确认请求      
    u16 safe_en:1;//安全使能
    u16 frame_type:2;//帧类型
}sMacFrameControl;

//停止转发帧
typedef struct
{
    u8  resv:6;//预留
    u8  frame_type:2;//帧类型
    u16 nid;//NID
    u8  data;//数据域
}sMacStopRelayFrame;

//信标帧
typedef struct
{
    sMacFrameControl framecontrol;//帧控制域
    u8  mac_dsn;//帧序号
    u16 nid;//NID
    u8  src_addr[6];//源地址
    u16 dst_addr;//目标地址
    u8  relay_cyc;//转发周期
    u16 relay_slot_duration;//转发时隙
    u8  data;//数据域
}sMacBeaconFrame;

//数据帧
typedef struct 
{
    sMacFrameControl framecontrol;//帧控制域
    u8  mac_dsn;//帧序号
    u16 nid;//NID
    u16 src_addr;//源地址
    u16 dst_addr;//目标地址
    u8  data;//数据域
}sMacDataShortFrame;

//数据帧
typedef struct 
{
    sMacFrameControl framecontrol;//帧控制域
    u8  mac_dsn;//帧序号
    u16 nid;//NID
    u16 src_addr;//源地址
    u8  dst_addr[6];//目标地址
    u8  data;//数据域
}sMacDataShortLongFrame;

//数据帧
typedef struct 
{
    sMacFrameControl framecontrol;//帧控制域
    u8  mac_dsn;//帧序号
    u16 nid;//NID
    u8  src_addr[6];//源地址
    u16 dst_addr;//目标地址
    u8  data;//数据域
}sMacDataLongShortFrame;

//数据帧
typedef struct 
{
    sMacFrameControl framecontrol;//帧控制域
    u8  mac_dsn;//帧序号
    u16 nid;//NID
    u8  src_addr[6];//源地址
    u8  dst_addr[6];//目标地址
    u8  data;//数据域
}sMacDataLongFrame;
#endif 
typedef struct {
unsigned char   mac_ack_wait_duration;          //在发送数据帧之后等待确认帧到达的最大时间，单位：100毫秒
unsigned char   mac_BSN;                        //信标帧序号计数器
unsigned char   mac_DSN;                        //数据帧或命令帧序号计数器
unsigned char   mac_NB;                         //CSMA-CA退让次数计数
unsigned char   mac_BE;                         //CSMA-CA退让指数
unsigned char   mac_min_BE;                     //CSMA-CA算法中回退指数的最小值。如果这个值设置为0，则CSMA-CA算法的第一次尝试中冲突避让功能是被禁止的
unsigned short  mac_net_ID;                     //16bit网络地址识别
unsigned short  mac_bak_net_ID;
unsigned short  mac_short_ADDR;                 //节点16bit短地址
unsigned char   mac_long_addr[LONG_ADDR_LEN];   //节点长地址
//unsigned char   mac_CCA_delay_ZCP;              //定义CCA间隔时间，单位：过零点数。1=每个过零点后都进行CCA，不能为偶数
unsigned char   mac_CF_period;                  //固定等待时隙，用于发送确认帧，单位50ms
unsigned char   mac_rand_period;                //CSMA/CA随机退让周期
//unsigned char   mac_TDMA_levels;                //TDMA转发圈数
//unsigned short  mac_TDMA_cycles;                //TDMA转发时隙
unsigned char   mac_TDMA_slot;
//unsigned short  mac_TDMA_total;
//unsigned char   mac_edge_mode;                  //载波发送边沿
//unsigned char   mac_phase;                      //MAC相位
//unsigned char   mac_ZCP_level;
//unsigned char   Wait_Ack;                       //等待下一级响应
unsigned char   Domain_Name;                    //域名
unsigned char   num;
unsigned char   mac_counter_enable;
unsigned char   mac_router_error;
unsigned char   mac_priority_judge:1;           //transfer rule 0: low RSSI transfer first 1: high rssi transfer first  
unsigned char   mac_priority:2;                 //transfer priority
unsigned char   mac_transfer_flag:1;            //mac_transfer complete
unsigned char   mac_transfer_start    :1;       //start transfer,0: waiting transfer,1:start transfer
unsigned char   mac_set_flag:1;
unsigned char   mac_stopRelay_status:1;
unsigned char   mac_send_status:1;
unsigned char   mac_match_type:1;
unsigned char   Mac_small_rand;
unsigned char   Mac_stop_relay_num;
}MACATTRIBUTE;


typedef struct
{
    u8 longAddr [6];
    u8 shortAddr[2];
}mac_addr;


typedef struct
{
    u8       mac_DSN;
    u16      mac_NID;                  //NID (NID的确定标准，NID侦听子节点做不做，单纯主节点做有用吗)
    //u8  mac_Addr[6];                 //长地址 短地址固定为0
    mac_addr nodeMacAddr;
}sMacCommAttr;


//NID侦听列表
typedef struct 
{
    u8  NIDFlag;//NID更新标志
    u8  NIDCount;//NID计数器
    u8  NIDIndex;//NID更新序号
    u16 NIDList[MaxNIDCount];//NID清单
}sMacNIDList;

typedef enum
{
    MAC_FRAME_DATA      = 0x01,               //数据帧
    MAC_FRAME_ACK       = 0x02,               //应答帧
    MAC_FRAME_STOPRELAY = 0x03,               //停止转发帧
    MAC_FRAME_RESERVE   = 0x04                //预留
}eMacFrameType;

//发送子状态
typedef enum
{
    SEND_SUB_STATUS_TX,          //立即发送
    SEND_SUB_STATUS_CSMA,        //检测信道
    SEND_SUB_STATUS_WAIT,        //等待时隙
    SEND_SUB_STATUS_CS,           //正在信道检测
    SEND_SUB_STATUS_STOPRELAY
}eMacSendSubStatus;


typedef enum
{
    OPTION_NO_ACK  = 0x00,        //不要求接收方发送确认帧
    OPTION_ACK     = 0x01,        //需要接收方发送确认帧
}eMacTxOption;




/* 属性列表 */
typedef struct 
{
    u8  mac_NB;                   //CSMA-CA退让次数
    u8  mac_BE;                   //CSMA-CA退让指数
    u8  mac_AllNet;               //网络标识    0 本网   1   全网
}sMacAttr;

//接收数据
typedef struct 
{
    u16 mac_recv_buf_len;         //接收帧数据长度
    u8  mac_recv_buf[MacBuffLen]; //接收帧数据缓存区
    u8  mac_recv_frame_type;      //接收帧数据类型
    u8  mac_recv_rssi;            //接收帧信号值
    u8  mac_recv_data_ready;      //是否接收到帧标识
}sMacRecv;


//发送数据
typedef struct
{
    u8  send_frame_type;           //发送的帧类型
    u8  send_status;               //发送状态
    u8  send_sub_status;           //发送子状态
    u16 send_CCA_delay;            //发送CCA延时
    u16 send_buf_len;              //发送数据缓冲区长度
    u8  send_buf[MacBuffLen];      //发送数据缓冲区
    u8  stoprelay_len;             //停止转发缓冲区长度
    u8  stoprelay_buf[23];         //停止转发缓冲区 新协议4 旧协议 23
}sMacSend;


typedef struct
{
    u8        macProtocolVersion;  /* 常量 */
    u8        macReseved:2;
    u8        macDestAddrType:1;
    u8        macSourceAddrType:1;
    u8        macACK:1;
    u8        macSafty:1;
    u8        macFrameType:2;   
}st_frame_ctrl;


typedef struct
{
    st_frame_ctrl   mac_ctrl;
    u8              mac_dsn;
    u16             nid;                /* 初始化时提供 */
    u8*             macSourceAddr;
    u8*             macDestAddr;
    u8*             macData;
    u16             mac_check;
}st_MacFrame;

//MAC层停止盲中继转发结构体
typedef struct
{
    unsigned char BFrameType : 2        //帧类型
    unsigned char BReserve : 6;
    unsigned short B_NID;               // NID
    unsigned char life_cycle;           //生命周期
}BSTOP_REALY_PARAM,*PBSTOP_RELAY_PARAM;


#if 0
MLME_GET_request
MLME_GET_confirm
MCPS-DATA.confirm
#endif


/***************MAC层主函数***************/
void Mac_Init(void);
void Mac_Para_Init(void);
void Mac_Proc(void);
void Mac_CCA_Proc(void);
/***************MAC层主函数***************/

/***************MAC层管理服务***************/
u8 Mac_GetAttr(u8 attr,u8 attrlen,u8* val);
u8 Mac_SetAttr(u8 attr,u8 attrlen,u8* val);
/***************MAC层管理服务***************/

/***************MAC层数据服务接口***************/
u8 Mac_StopRelay_Request(u8 handle,u8 life_perild,u8 flag);
u8 Mac_Beacon_Request(u8 handle,u16 msdulen,u8* msdu);
u8 Mac_Data_Request(u8 handle,u8 addrtype,u8* dstaddr,u16 msdulen,u8* msdu,u8 txoptions);
/***************MAC层数据服务接口***************/

/***************MAC层与网络层接口***************/
extern u8 Nwk_CheckRelay_Request(u8* msdu);
extern u8 Nwk_Beacon_Indication(u8 srcaddrtype,u8* srcaddr,u16 msdulen,u8* msdu,u8 period,u16 slot,u8 rssi);
extern u8 Nwk_Data_Indication(u8 srcaddrtype,u8* srcaddr,u16 msdulen,u8* msdu,u8 rssi);
/***************MAC层与网络层接口***************/

/***************MAC层测试接口***************/
void Mac_NIDList_Print(void);
void Mac_NIDList_Clear(void);
/***************MAC层测试接口***************/

#endif
