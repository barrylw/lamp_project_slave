#ifndef _ROMDOM_H
#define _ROMDOM_H

#include "Basedefine.h"
#include "Printf.h"


/*——————————————————————————
* 函 数 名：GetRand
* 输入参数：min:随机值下限		max:随机值上限
* 输出参数：None
* 返 回 值：随机种子源
* 功能说明：获取指定范围的随机值
*——————————————————————————*/
u16 GetRand(u16 min,u16 max);

/*——————————————————————————
* 函 数 名：SelectRandom
* 输入参数：n:随机种子源 range:3~16
* 输出参数：None
* 返 回 值：随机种子源
* 功能说明：选择随机种子源
*——————————————————————————*/
u16 SelectRandom(u8 n);

#endif