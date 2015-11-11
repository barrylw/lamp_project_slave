/*����������������������������������������������������
* �� �� ����MAC.h  
* ��    �ߣ�����
* ��    �ڣ�2014-04-06
* �ļ�˵����MAC��ͷ�ļ�
*����������������������������������������������������*/
#ifndef _MAC_H
#define _MAC_H

#include "phy.h"

#pragma pack(1)

#ifdef __MACDEBUG
#define MACDBG(CODE) do{printf("%02d:%02d:%02d->", TimeRegs.hour, TimeRegs.minute, TimeRegs.second); CODE}while(0)
#else
#define MACDBG(CODE)
#endif

#define MacProtoVer                    1          //MAC��Э��汾��
#define MaxMSDUSize                    238        //MAC֡�غ�������ֽ���
#define MacBuffLen                     255        //(MaxMSDUSize+20)//MAC����󻺳�������
#define MaxNB                          6          //CSMA-CA�㷨�е����ô������ֵ
#define MaxBE                          10         //CSMA-CA�㷨�е�����ָ�����ֵ
#define MinBE                          3
#define MaxNIDCount                    20         //NID�����б������

#define BroadNID                       0xffff        //�㲥NID
#define BroadAimAddr                   0xffff        //�㲥Ŀ���ַ

#define WaitSendMaxTime                500        //MAC�����ȴ�����ʱ�䣬5��
#define SendingMaxTime                 400        //MAC������ͳ���ʱ�䣬4��
#define ReadMaxTime                    300        //MAC������ȡ����ʱ�䣬3��

#define NotMatch                       0        //��ƥ��
#define Match                          1        //ƥ��

#define MacSendFailure                 0        //MAC�㷢��ʧ��
#define MacSendSuccess                 1        //MAC�㷢�ͳɹ�

#define IFLASH_TABLEID_MAC             FLASH_PARAMETER_ADDRESS
#define NIDFiledIndex                  0        //NID����Ӧ�������
#define MacVSSSize                     50        //MAC��ʹ��������С

#define TIME_SLOT_LENGTH                15        //MS
#define TIME_CFP_LENGTH                 50

#if 0
//��ȡMAC������ʱ�ķ�����Ϣ
typedef enum
{
    RET_MAC_SUCCESS,//���سɹ�
    RET_MAC_ATTRLEN_ERR,//���Գ��ȴ���
    RET_MAC_ATTR_NOEXIST,//������������
}eMacRet;

//����ѡ��
typedef enum
{
    OPTION_DEFAULT  = 0x00, //Ĭ��
    OPTION_ACK_READ = 0x01  //���ͷ�����ʶ   1 ��Ҫ��ȡȷ��0 ����Ҫ��ȡȷ��
}eMacTxOption;

//֡����
typedef enum
{
    //MAC_FRAME_BEACON,//�ű�֡
    MAC_FRAME_DATA,      //����֡
    MAC_FRAME_ACK,       //Ӧ��֡
    MAC_FRAME_STOPRELAY, //ֹͣת��֡
    MAC_FRAME_RESERVE    //Ԥ��
}eMacFrameType;

/* ΪʲôҪ�㷢��״̬�ͷ�����״̬ */
//����״̬
typedef enum
{
    SEND_STATUS_IDLE,//����δ���
    SEND_STATUS_FINISH,//�������
    SEND_STATUS_START,//��������
    SEND_STATUS_TX_ING//������
}eMacSendStatus;

//������״̬
typedef enum
{
    SEND_SUB_STATUS_TX,   //��������
    SEND_SUB_STATUS_CSMA, //����ŵ�
    SEND_SUB_STATUS_WAIT  //�ȴ�ʱ϶
}eMacSendSubStatus;

/***************MAC������***************/
/* �������ͣ���ȡ���Ի���������ʱ��switch-case*/
typedef enum 
{
    MACA_SEQ,           //֡�������r
    MACA_NB,            //CSMA-CA���ô�������r/w
    MACA_BE,            //CSMA-CA����ָ������r/w
    MACA_NID,           //NID����r/w
    MACA_ADDR,          //����ַ����r/w
    MACA_ADDRTYPE,      //Դ��ַ��������r/w
    MACA_ALLNET,        //�����ʶ����r/w
    MACA_SENDCONFIRM,   //����ȷ������r
    MACA_SENDRESULT     //���ͽ������r
}eMacAttr;

/* Ϊʲô����ҲҪ������ */
typedef struct
{
    u8  mac_SEQ;                  //֡���
    u8  mac_NB;                   //CSMA-CA���ô���
    u8  mac_BE;                   //CSMA-CA����ָ��
    u8  mac_AddrType;             //Դ��ַ����  0 ����ַ 1 �̵�ַ
    u8  mac_AllNet;               //�����ʶ    0 ����   1   ȫ��
}sMacAttr;

typedef struct
{
    u16 mac_NID;                  //NID
    u8  mac_Addr[6];              //����ַ �̵�ַ�̶�Ϊ0
}sMacCommAttr;
/***************MAC������***************/

//��������
typedef struct 
{
    u16 mac_recv_buf_len;        //����֡���ݳ���
    u8 mac_recv_buf[MacBuffLen]; //����֡���ݻ�����
    u8 mac_recv_rssi;            //����֡�ź�ֵ
    u8 mac_recv_data_ready;      //�Ƿ���յ�֡��ʶ
    //u8 mac_recv_mode;          //����֡ģʽ        0x04,0x05,0x07,0x08�ֱ���BPSK��QPSK��ENHANCE��³��ģʽ
}sMacRecv;

//��������
typedef struct
{
    //u8 stoprelay_handle;         //����ֹͣת�������
    //u8 dataframe_handle;         //�������ݰ����
    u8  follow_send_stoprelay;     //��������ֹͣת����
    u8  follow_send_dataframe;     //�����������ݰ�
    u16 wait_read_time;            //�ȴ���ȡ��ʱʱ��
    u16 wait_send_time;            //�ȴ���������ʱ��
    u16 wait_send_ack_time;        //�ȴ��������ʱ��
    u8  send_ZCP;                  //�������Ƿ�ƥ�� 1 ƥ��  ZCP zero crossing point
    u8  send_frame_type;           //���͵�֡����
    u8  send_status;               //����״̬
    u8  send_sub_status;           //������״̬
    u8  send_result;               //���ͽ��
    u8  send_result_read;          //���ͽ������  1 ��Ҫ�ȴ���ȡ������� 0 ����Ҫ�ȴ���ȡ����
    u8  send_mode;                 //����ģʽ
    u16 send_CCA_delay;            //����CCA��ʱ
    u16 send_buf_len;              //�������ݻ���������
    u8  send_buf[MacBuffLen];      //�������ݻ�����
    u8  stoprelay_len;             //ֹͣת������������
    u8  stoprelay_buf[23];         //ֹͣת�������� ��Э��4 ��Э��23
}sMacSend;

//NID�����б�
typedef struct 
{
    u8  NIDFlag;//NID���±�־
    u8  NIDCount;//NID������
    u8  NIDIndex;//NID�������
    u16 NIDList[MaxNIDCount];//NID�嵥
}sMacNIDList;

//֡������
typedef struct
{
    u16 mac_protocol_verison:4;//�汾
    u16 reservation:4;//Ԥ�� 
    u16 send_phase:2;//������λ
    u16 dstaddr_type:1;//Ŀ���ַ����  
    u16 addr_type:1;//Դ��ַ����
    u16 mac_ack:1;//ȷ������      
    u16 safe_en:1;//��ȫʹ��
    u16 frame_type:2;//֡����
}sMacFrameControl;

//ֹͣת��֡
typedef struct
{
    u8  resv:6;//Ԥ��
    u8  frame_type:2;//֡����
    u16 nid;//NID
    u8  data;//������
}sMacStopRelayFrame;

//�ű�֡
typedef struct
{
    sMacFrameControl framecontrol;//֡������
    u8  mac_dsn;//֡���
    u16 nid;//NID
    u8  src_addr[6];//Դ��ַ
    u16 dst_addr;//Ŀ���ַ
    u8  relay_cyc;//ת������
    u16 relay_slot_duration;//ת��ʱ϶
    u8  data;//������
}sMacBeaconFrame;

//����֡
typedef struct 
{
    sMacFrameControl framecontrol;//֡������
    u8  mac_dsn;//֡���
    u16 nid;//NID
    u16 src_addr;//Դ��ַ
    u16 dst_addr;//Ŀ���ַ
    u8  data;//������
}sMacDataShortFrame;

//����֡
typedef struct 
{
    sMacFrameControl framecontrol;//֡������
    u8  mac_dsn;//֡���
    u16 nid;//NID
    u16 src_addr;//Դ��ַ
    u8  dst_addr[6];//Ŀ���ַ
    u8  data;//������
}sMacDataShortLongFrame;

//����֡
typedef struct 
{
    sMacFrameControl framecontrol;//֡������
    u8  mac_dsn;//֡���
    u16 nid;//NID
    u8  src_addr[6];//Դ��ַ
    u16 dst_addr;//Ŀ���ַ
    u8  data;//������
}sMacDataLongShortFrame;

//����֡
typedef struct 
{
    sMacFrameControl framecontrol;//֡������
    u8  mac_dsn;//֡���
    u16 nid;//NID
    u8  src_addr[6];//Դ��ַ
    u8  dst_addr[6];//Ŀ���ַ
    u8  data;//������
}sMacDataLongFrame;
#endif 
typedef struct {
unsigned char   mac_ack_wait_duration;          //�ڷ�������֮֡��ȴ�ȷ��֡��������ʱ�䣬��λ��100����
unsigned char   mac_BSN;                        //�ű�֡��ż�����
unsigned char   mac_DSN;                        //����֡������֡��ż�����
unsigned char   mac_NB;                         //CSMA-CA���ô�������
unsigned char   mac_BE;                         //CSMA-CA����ָ��
unsigned char   mac_min_BE;                     //CSMA-CA�㷨�л���ָ������Сֵ��������ֵ����Ϊ0����CSMA-CA�㷨�ĵ�һ�γ����г�ͻ���ù����Ǳ���ֹ��
unsigned short  mac_net_ID;                     //16bit�����ַʶ��
unsigned short  mac_bak_net_ID;
unsigned short  mac_short_ADDR;                 //�ڵ�16bit�̵�ַ
unsigned char   mac_long_addr[LONG_ADDR_LEN];   //�ڵ㳤��ַ
//unsigned char   mac_CCA_delay_ZCP;              //����CCA���ʱ�䣬��λ�����������1=ÿ�������󶼽���CCA������Ϊż��
unsigned char   mac_CF_period;                  //�̶��ȴ�ʱ϶�����ڷ���ȷ��֡����λ50ms
unsigned char   mac_rand_period;                //CSMA/CA�����������
//unsigned char   mac_TDMA_levels;                //TDMAת��Ȧ��
//unsigned short  mac_TDMA_cycles;                //TDMAת��ʱ϶
unsigned char   mac_TDMA_slot;
//unsigned short  mac_TDMA_total;
//unsigned char   mac_edge_mode;                  //�ز����ͱ���
//unsigned char   mac_phase;                      //MAC��λ
//unsigned char   mac_ZCP_level;
//unsigned char   Wait_Ack;                       //�ȴ���һ����Ӧ
unsigned char   Domain_Name;                    //����
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
    u16      mac_NID;                  //NID (NID��ȷ����׼��NID�����ӽڵ����������������ڵ���������)
    //u8  mac_Addr[6];                 //����ַ �̵�ַ�̶�Ϊ0
    mac_addr nodeMacAddr;
}sMacCommAttr;


//NID�����б�
typedef struct 
{
    u8  NIDFlag;//NID���±�־
    u8  NIDCount;//NID������
    u8  NIDIndex;//NID�������
    u16 NIDList[MaxNIDCount];//NID�嵥
}sMacNIDList;

typedef enum
{
    MAC_FRAME_DATA      = 0x01,               //����֡
    MAC_FRAME_ACK       = 0x02,               //Ӧ��֡
    MAC_FRAME_STOPRELAY = 0x03,               //ֹͣת��֡
    MAC_FRAME_RESERVE   = 0x04                //Ԥ��
}eMacFrameType;

//������״̬
typedef enum
{
    SEND_SUB_STATUS_TX,          //��������
    SEND_SUB_STATUS_CSMA,        //����ŵ�
    SEND_SUB_STATUS_WAIT,        //�ȴ�ʱ϶
    SEND_SUB_STATUS_CS,           //�����ŵ����
    SEND_SUB_STATUS_STOPRELAY
}eMacSendSubStatus;


typedef enum
{
    OPTION_NO_ACK  = 0x00,        //��Ҫ����շ�����ȷ��֡
    OPTION_ACK     = 0x01,        //��Ҫ���շ�����ȷ��֡
}eMacTxOption;




/* �����б� */
typedef struct 
{
    u8  mac_NB;                   //CSMA-CA���ô���
    u8  mac_BE;                   //CSMA-CA����ָ��
    u8  mac_AllNet;               //�����ʶ    0 ����   1   ȫ��
}sMacAttr;

//��������
typedef struct 
{
    u16 mac_recv_buf_len;         //����֡���ݳ���
    u8  mac_recv_buf[MacBuffLen]; //����֡���ݻ�����
    u8  mac_recv_frame_type;      //����֡��������
    u8  mac_recv_rssi;            //����֡�ź�ֵ
    u8  mac_recv_data_ready;      //�Ƿ���յ�֡��ʶ
}sMacRecv;


//��������
typedef struct
{
    u8  send_frame_type;           //���͵�֡����
    u8  send_status;               //����״̬
    u8  send_sub_status;           //������״̬
    u16 send_CCA_delay;            //����CCA��ʱ
    u16 send_buf_len;              //�������ݻ���������
    u8  send_buf[MacBuffLen];      //�������ݻ�����
    u8  stoprelay_len;             //ֹͣת������������
    u8  stoprelay_buf[23];         //ֹͣת�������� ��Э��4 ��Э�� 23
}sMacSend;


typedef struct
{
    u8        macProtocolVersion;  /* ���� */
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
    u16             nid;                /* ��ʼ��ʱ�ṩ */
    u8*             macSourceAddr;
    u8*             macDestAddr;
    u8*             macData;
    u16             mac_check;
}st_MacFrame;

//MAC��ֹͣä�м�ת���ṹ��
typedef struct
{
    unsigned char BFrameType : 2        //֡����
    unsigned char BReserve : 6;
    unsigned short B_NID;               // NID
    unsigned char life_cycle;           //��������
}BSTOP_REALY_PARAM,*PBSTOP_RELAY_PARAM;


#if 0
MLME_GET_request
MLME_GET_confirm
MCPS-DATA.confirm
#endif


/***************MAC��������***************/
void Mac_Init(void);
void Mac_Para_Init(void);
void Mac_Proc(void);
void Mac_CCA_Proc(void);
/***************MAC��������***************/

/***************MAC��������***************/
u8 Mac_GetAttr(u8 attr,u8 attrlen,u8* val);
u8 Mac_SetAttr(u8 attr,u8 attrlen,u8* val);
/***************MAC��������***************/

/***************MAC�����ݷ���ӿ�***************/
u8 Mac_StopRelay_Request(u8 handle,u8 life_perild,u8 flag);
u8 Mac_Beacon_Request(u8 handle,u16 msdulen,u8* msdu);
u8 Mac_Data_Request(u8 handle,u8 addrtype,u8* dstaddr,u16 msdulen,u8* msdu,u8 txoptions);
/***************MAC�����ݷ���ӿ�***************/

/***************MAC���������ӿ�***************/
extern u8 Nwk_CheckRelay_Request(u8* msdu);
extern u8 Nwk_Beacon_Indication(u8 srcaddrtype,u8* srcaddr,u16 msdulen,u8* msdu,u8 period,u16 slot,u8 rssi);
extern u8 Nwk_Data_Indication(u8 srcaddrtype,u8* srcaddr,u16 msdulen,u8* msdu,u8 rssi);
/***************MAC���������ӿ�***************/

/***************MAC����Խӿ�***************/
void Mac_NIDList_Print(void);
void Mac_NIDList_Clear(void);
/***************MAC����Խӿ�***************/

#endif
