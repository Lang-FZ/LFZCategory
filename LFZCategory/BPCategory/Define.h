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

////自定义Log
#ifdef DEBUG //... 可变参数
#define BossLog(...) NSLog(__VA_ARGS__)
#else
#define BossLog(...)
#endif

#define kDefaultHeaderIconHolderImage @"jl_icon5"
#define kDefaultHolderImage @"SPE_Default_img"

//字体适配(目前统一使用系统默认字体)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedBoldFontSize(R)  [UIFont boldSystemFontOfSize:AdaptedWidth(R)]

//不同屏幕尺寸适配（414，736是因为效果图为iPhone6plus如果不是则根据实际情况修改）
#define kScreenWidthRatio  (kSCREEN_WIDTH / 375.0)
#define kScreenHeightRatio (kSCREEN_HEIGHT / 667.0)
#define AdaptedWidth(x) ((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ((x) * kScreenHeightRatio)

/************************字体*******************************/
#pragma mark-字体

#define SYSTEkFONT_SIZE(fontSize) [UIFont systemFontOfSize:fontSize]


#define kFontM10 AdaptedFontSize(10)
#define kFontM11 AdaptedFontSize(11)
#define kFontS12 AdaptedFontSize(12)
#define kFontS13 AdaptedFontSize(13)
#define kFontX14 AdaptedFontSize(14)
#define kFontX15 AdaptedFontSize(15)
#define kFontXX16 AdaptedFontSize(16)
#define kFontXXl18 AdaptedFontSize(18)

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

// 随机颜色
//#define kRANDOkCOLOR kRGB_COLOR(arc4randokuniform(256), arc4randokuniform(256), arc4randokuniform(256))

//分割线颜色
#define kSEPARATE_COLOR kRGBA_COLOR(0,0,0,0.3)

// 透明
#define kCLEAR_COLOR [UIColor clearColor]

//导航条颜色
#define kNAVGATION_BAR_COLOR kRGB_COLOR(255, 255, 255)
//导航条颜色
#define kNAVGATION_BLUE_COLOR kRGB_COLOR(0, 120, 255)

//线条颜色
#define kBLINE_COLOR kRGB_COLOR(255, 222, 52)
//点颜色
#define kBPOINT_COLOR kRGB_COLOR(244, 170, 52)


//背景色
#define kBACKGROUND_COLOR kRGB_COLOR(240, 242, 245)

//按钮蓝色
#define kBluesColor kRGB_COLOR(51, 146, 255)
#define kBlueColor  kRGB_COLOR(0,133,255)
//按钮蓝色不可点击颜色
#define kBlueLightColor kRGBA_COLOR(51,146,255,0.7)

//cell左边文字颜色
#define kCELLTEXTLEFT_COLOR kRGB_COLOR(51, 51, 51)

//cell灰色字体颜色
#define kCELLTEXTRIGHTGRAY_COLOR kRGB_COLOR(187, 187, 187)



//白色
#define kWHITE_COLOR [UIColor whiteColor]
#define kWhiteColor  [UIColor whiteColor]
#define kGrayColor   [UIColor grayColor]

#define kIphone6pWidht 414

#define  kLineHeight 0.5


/************************其他常用*******************************/

#pragma mark-其他常用
#define kNavigationBarHeight 64
#define kBottomToolBarHeight 44
#define kTabbarHeight 49
#define kMargin_M 10
#define kLeftMargin 15



// 请求路径
#define kAPI(subPath) [NSString stringWithFormat:@"%@%@", Domain, subPath]

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

//缓存工具
#define CACHE_TOOL [CacheTool sharedCacheTool]

//App工具
#define APP_TOOL [AppTool sharedAppTool]

#define kSCREEN [UIScreen mainScreen]
#define kSCREEN_HEIGHT CGRectGetHeight([kSCREEN bounds])
#define kSCREEN_WIDTH  CGRectGetWidth([kSCREEN bounds])

#endif /* Define_h */
