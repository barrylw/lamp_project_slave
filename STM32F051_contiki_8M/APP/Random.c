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

/*——————————————————————————
* 函 数 名：SeedRandom
* 输入参数：seed：输入种子值
* 输出参数：None
* 返 回 值：None
* 功能说明：选择一个种子数
*——————————————————————————*/
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

/*——————————————————————————
* 函 数 名：shift
* 输入参数：val：输入值
* 输出参数：None
* 返 回 值：运算后的新值
* 功能说明：将输入值进行转换
*——————————————————————————*/
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

/*——————————————————————————
* 函 数 名：GetRandom
* 输入参数：None
* 输出参数：None
* 返 回 值：随机种子
* 功能说明：获取指定种子值
*——————————————————————————*/
static u16 GetRandom(void)
{
    SeedRandom(gTimeCount);

    return (shift(&seed0, 0x0062)
    ^ shift(&seed1, 0x100B));
}

/*——————————————————————————
* 函 数 名：GetRand
* 输入参数：min:随机值下限		max:随机值上限
* 输出参数：None
* 返 回 值：随机种子源
* 功能说明：获取指定范围的随机值
*——————————————————————————*/
u16 GetRand(u16 min,u16 max)
{
    if(min>max)
    {
        return min;
    }
    return GetRandom()%(max-min)+min;
}

/*——————————————————————————
* 函 数 名：Selectshift
* 输入参数：n:随机种子源 
* 输出参数：None
* 返 回 值：转换后的值
* 功能说明：将输入值进行转换
*——————————————————————————*/
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

/*——————————————————————————
* 函 数 名：SelectRandom
* 输入参数：n:随机种子源 range:3~16
* 输出参数：None
* 返 回 值：随机种子源
* 功能说明：选择随机种子源
*——————————————————————————*/
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