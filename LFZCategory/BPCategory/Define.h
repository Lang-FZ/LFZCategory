//
//  Define.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#ifndef Define_h
#define Define_h

#include <Availability.h>

//字体适配(目前统一使用系统默认字体)
#define SYSTEkFONT_SIZE(fontSize) [UIFont systemFontOfSize:fontSize]
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedBoldFontSize(R)  [UIFont boldSystemFontOfSize:AdaptedWidth(R)]

//不同屏幕尺寸适配（414，736是因为效果图为iPhone6plus如果不是则根据实际情况修改）
#define kScreenWidthRatio  (kSCREEN_WIDTH / 375.0)
#define kScreenHeightRatio (kSCREEN_HEIGHT / 667.0)
#define AdaptedWidth(x) ((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ((x) * kScreenHeightRatio)

#pragma mark-颜色

/************************颜色*******************************/

// RGB颜色
#define kRGB_COLOR(r,g,b)  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

// RGB颜色带透明度
#define kRGBA_COLOR(r,g,b,a)  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

//16进制颜色
#define kRGB_SIXTEEN(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//16进制颜色
#define M_RGB_SIXTEEN(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/************************其他常用*******************************/

#pragma mark-其他常用
#define kNavigationBarHeight 64
#define kBottomToolBarHeight 44
#define kTabbarHeight 49

//弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//沙盒路劲
#define kPathInDoc(filename) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:filename]

//偏好设置
#define kUSER_DEFAULTS [NSUserDefaults standardUserDefaults]

//通知中心
#define kNOTIFICATION_CENTER [NSNotificationCenter defaultCenter]

//快速移除通知
#define REMOVE_NOTIFICATION [[NSNotificationCenter defaultCenter] removeObserver:self];

#define kScreen [UIScreen mainScreen]
#define kScreen_Width  CGRectGetWidth([kScreen bounds])
#define kScreen_Height CGRectGetHeight([kScreen bounds])

#endif /* Define_h */
