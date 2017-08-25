//
//  NSDate+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/23.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, bp_TimeZone_Type) {
    bp_TimeZone_zz,     //  GMT+8
    bp_TimeZone_ZZ,     //  +0800
    bp_TimeZone_zzzz,   //  中国标准时间
    bp_TimeZone_ZZZZ    //  GMT+08:00
};
typedef NS_ENUM(NSInteger, bp_Year_Type) {
    bp_Year_yy,         //  年   17
    bp_Year_yyyy        //  年   2017
};
typedef NS_ENUM(NSInteger, bp_Month_Type) {
    bp_Month_M,         //  月   8
    bp_Month_MM,        //  月   08
    bp_Month_MMM_zh,    //      8月
    bp_Month_MMM_en,    //      Aug
    bp_Month_MMMM_zh,   //      八月
    bp_Month_MMMM_en    //      August
};
typedef NS_ENUM(NSInteger, bp_Day_Type) {
    bp_Day_d,           //  日   1
    bp_Day_dd           //  日   01
};
typedef NS_ENUM(NSInteger, bp_Week_Type) {
    bp_Week_EE_zh,      //  周四
    bp_Week_EE_en,      //  Thu
    bp_Week_EEEE_zh,    //  星期四
    bp_Week_EEEE_en     //  Thursday
};
typedef NS_ENUM(NSInteger, bp_AnnoDomini_type) {
    bp_AnnoDomini_GG_zh,    //  公元
    bp_AnnoDomini_GG_en,    //  AD
    bp_AnnoDomini_GGGG      //  Anno Domini
};
typedef NS_ENUM(NSInteger, bp_Hour_type) {
    bp_Hour_h,          //  12小时制 2 PM
    bp_Hour_hh,         //  12小时制 02 PM
    bp_Hour_H,          //  24小时制 1
    bp_Hour_HH          //  24小时制 01
};
typedef NS_ENUM(NSInteger, bp_Minute_type) {
    bp_Minute_m,        //  分 1
    bp_Minute_mm        //  分 01
};
typedef NS_ENUM(NSInteger, bp_Second_type) {
    bp_Second_s,        //  秒 1
    bp_Second_ss,       //  秒 01
    bp_Millisecond_SSS  //  毫秒 三位 111
};
typedef NS_ENUM(NSInteger, bp_HourMinuteSecond_type) {
    bp_hms,             //  12小时制 h:m:s
    bp_hmsS,            //  12小时制 h:m:s.S
    bp_hmsSSS,          //  12小时制 h:m:s.SSS
    bp_hhmmss,          //  12小时制 hh:mm:ss
    bp_hhmmssS,         //  12小时制 hh:mm:ss.S
    bp_hhmmssSSS,       //  12小时制 hh:mm:ss.SSS
    bp_Hms,             //  24小时制 H:m:s
    bp_HmsS,            //  24小时制 H:m:s.S
    bp_HmsSSS,          //  24小时制 H:m:s.SSS
    bp_HHmmss,          //  24小时制 HH:mm:ss
    bp_HHmmssS,         //  24小时制 HH:mm:ss.S
    bp_HHmmssSSS        //  24小时制 HH:mm:ss.SSS
};
typedef NS_ENUM(NSInteger, bp_DateInterval_type) {
    bp_DateInterval_Space,                  //  2017 08 25
    bp_DateInterval_ShortHorizontalLine     //  2017-08-25
};

@interface NSDate (BPExtension)

#pragma mark - 通过 NSDate 转 字符串
#pragma mark - 时区
- (NSString *)bp_TimeZone:(bp_TimeZone_Type)type;

#pragma mark - 年
- (NSString *)bp_Year:(bp_Year_Type)type;

#pragma mark - 月
- (NSString *)bp_Month_M:(bp_Month_Type)type;

#pragma mark - 日
- (NSString *)bp_Day:(bp_Day_Type)type;

#pragma mark - 星期
- (NSString *)bp_Week:(bp_Week_Type)type;

#pragma mark - 公元
- (NSString *)bp_AnnoDomini:(bp_AnnoDomini_type)type;

#pragma mark - 时
- (NSString *)bp_Hour:(bp_Hour_type)type;

#pragma mark - 分
- (NSString *)bp_Minute:(bp_Minute_type)type;

#pragma mark - 秒
- (NSString *)bp_Second:(bp_Second_type)type;

#pragma mark - 时分秒
- (NSString *)bp_HourMinuteSecond:(bp_HourMinuteSecond_type)type;

#pragma mark - 通过 字符串 转 NSDate
#pragma mark - 获取某一年第一秒的 NSDate
/** yy 30 = 2030  60 = 1960   1951 - 2049 */
+ (NSDate *)bp_From_Year_yy:(NSString *)yy;
/** yyyy */
+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy;

#pragma mark - 获取 某一年某一月 第一秒的 NSDate
+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy Month_type:(bp_Month_Type)type Month_str:(NSString *)month;

#pragma mark - 获取 某一年某一月某一天 第一秒的 NSDate
+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy Month_type:(bp_Month_Type)month_type Month_str:(NSString *)month Day_type:(bp_Day_Type)day_type Day_str:(NSString *)day;

#pragma mark - 转换当前时间 字符串 为 NSDate
+ (NSDate *)bp_From_Month_type:(bp_Month_Type)month_type Day_type:(bp_Day_Type)day_type DateInterval_type:(bp_DateInterval_type)DI_type HourMinuteSecond_type:(bp_HourMinuteSecond_type)hms_type DateString:(NSString *)str;

@end

