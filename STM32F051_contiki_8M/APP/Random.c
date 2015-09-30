#include "Random.h"


const u8  RandomTable[14][5]={
    {3,1,1},
    {4,1,1},
    {5,2,1},
    {6,1,1},
    {7,3,1},
    {8,4,3,2,1},
    {9,4,1},
    {11,2,1},
    {10,3,1},
    {12,6,4,1,1},
    {13,4,3,1,1},
    {14,10,6,1,1},
    {15,1,1},
    {16,12,3,1,1},
} ;

u16 seed0 = 1;
u16 seed1 = 0xface;
extern vu32 gTimeCount;

/*����������������������������������������������������
* �� �� ����SeedRandom
* ���������seed����������ֵ
* ���������None
* �� �� ֵ��None
* ����˵����ѡ��һ��������
*����������������������������������������������������*/
void SeedRandom(u32 seed) 
{
    static u32 temp=0;

    if(seed!=temp)
    {
        temp=seed;
        seed0 = (u16) seed;

        if (seed0 == 0)
        {
            seed0 = 0xbeef;
        }

        seed1 = (u16) (seed >> 16);

        if (seed1 == 0)
        {
            seed1 = 0xface;
        }
    }
}

/*����������������������������������������������������
* �� �� ����shift
* ���������val������ֵ
* ���������None
* �� �� ֵ����������ֵ
* ����˵����������ֵ����ת��
*����������������������������������������������������*/
static u16 shift(u16 *val, u16 taps)
{
    u16 newVal = *val;

    if (newVal & 0x8000)
    {
        newVal ^= taps;
    }

    *val = newVal << 1;

    return newVal;
}

/*����������������������������������������������������
* �� �� ����GetRandom
* ���������None
* ���������None
* �� �� ֵ���������
* ����˵������ȡָ������ֵ
*����������������������������������������������������*/
static u16 GetRandom(void)
{
    SeedRandom(gTimeCount);

    return (shift(&seed0, 0x0062)
    ^ shift(&seed1, 0x100B));
}

/*����������������������������������������������������
* �� �� ����GetRand
* ���������min:���ֵ����		max:���ֵ����
* ���������None
* �� �� ֵ���������Դ
* ����˵������ȡָ����Χ�����ֵ
*����������������������������������������������������*/
u16 GetRand(u16 min,u16 max)
{
    if(min>max)
    {
        return min;
    }
    return GetRandom()%(max-min)+min;
}

/*����������������������������������������������������
* �� �� ����Selectshift
* ���������n:�������Դ 
* ���������None
* �� �� ֵ��ת�����ֵ
* ����˵����������ֵ����ת��
*����������������������������������������������������*/
static u16 Selectshift(u8 n,u16 *val, u16 taps)
{
    u16 limitvalue=1;
    u16 newVal = *val; 

    limitvalue<<=(n-1);

    if (newVal & limitvalue)
    {  
        newVal ^= taps;
        newVal&=(~limitvalue);
        newVal<<=1;
        newVal|=1;       
        *val=newVal;
    }
    else
    {
        *val = newVal << 1; 
    }
    newVal=*val;

    return newVal;
}

/*����������������������������������������������������
* �� �� ����SelectRandom
* ���������n:�������Դ range:3~16
* ���������None
* �� �� ֵ���������Դ
* ����˵����ѡ���������Դ
*����������������������������������������������������*/
u16 SelectRandom(u8 n)
{
    u8 j;
    u16 i;
    u16 ran;
    u16 sum=0;

    i=0;

    for(i=0;i<14;i++)
    {
        if(RandomTable[i][0]==n)
        {
            break;  
        }
    }

    if(i>=14)
    {
        return 0;
    }

    for(j=0;j<3;j++)
    {
        if((RandomTable[i][j+1]==0) && (RandomTable[i][j]==1))
        {
        break;
        }
        sum|=(((u16)1)<<(RandomTable[i][j+1]-1)); 
    }
    ran=Selectshift(n,&seed0,sum);

    return ran;
}