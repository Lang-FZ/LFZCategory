//
//  NSDate+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/23.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSDate+BPExtension.h"
#import <objc/message.h>

@interface NSDate ()

@property NSDateFormatter *bp_formatter;

@end

@implementation NSDate (BPExtension)

#pragma mark - setter getter

- (void)setBp_formatter:(NSDateFormatter *)bp_formatter {
    objc_setAssociatedObject(self, @"bp_formatter", bp_formatter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDateFormatter *)bp_formatter {
    if (objc_getAssociatedObject(self, @"bp_formatter") == nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [formatter setCalendar:calendar];
        
        objc_setAssociatedObject(self, @"bp_formatter", formatter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, @"bp_formatter");
}

#pragma mark - 强制时间制转换
/** 不受手机时间制设置影响 主要对 12/24小时制 有影响 并且月份、星期、公元 会默认英文 */
- (void)bp_HourSystem_12_24 {
    [self.bp_formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    [self.bp_formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
}
/** 中文 上海时区 */
- (void)bp_Chinese {
    [self.bp_formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    [self.bp_formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
}

#pragma mark - 通过 NSDate 转 字符串

#pragma mark - 时区

- (NSString *)bp_TimeZone:(bp_TimeZone_Type)type {
    
    if (type == bp_TimeZone_zz) {
        [self.bp_formatter setDateFormat:@"zz"];
    } else if (type == bp_TimeZone_ZZ) {
        [self.bp_formatter setDateFormat:@"ZZ"];
    } else if (type == bp_TimeZone_zzzz) {
        [self.bp_formatter setDateFormat:@"zzzz"];
    } else if (type == bp_TimeZone_ZZZZ) {
        [self.bp_formatter setDateFormat:@"ZZZZ"];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 年

- (NSString *)bp_Year:(bp_Year_Type)type {
    if (type == bp_Year_yy) {
        [self.bp_formatter setDateFormat:@"yy"];
    } else if (type == bp_Year_yyyy) {
        [self.bp_formatter setDateFormat:@"yyyy"];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 月

- (NSString *)bp_Month_M:(bp_Month_Type)type {
    if (type == bp_Month_M) {
        [self.bp_formatter setDateFormat:@"M"];
    } else if (type == bp_Month_MM) {
        [self.bp_formatter setDateFormat:@"MM"];
    } else if (type == bp_Month_MMM_zh) {
        [self.bp_formatter setDateFormat:@"MMM"];
        [self bp_Chinese];
    } else if (type == bp_Month_MMM_en) {
        [self.bp_formatter setDateFormat:@"MMM"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Month_MMMM_zh) {
        [self.bp_formatter setDateFormat:@"MMMM"];
        [self bp_Chinese];
    } else if (type == bp_Month_MMMM_en) {
        [self.bp_formatter setDateFormat:@"MMMM"];
        [self bp_HourSystem_12_24];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 日

- (NSString *)bp_Day:(bp_Day_Type)type {
    if (type == bp_Day_d) {
        [self.bp_formatter setDateFormat:@"d"];
    } else if (type == bp_Day_dd) {
        [self.bp_formatter setDateFormat:@"dd"];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 星期

- (NSString *)bp_Week:(bp_Week_Type)type {
    if (type == bp_Week_EE_zh) {
        [self.bp_formatter setDateFormat:@"EE"];
        [self bp_Chinese];
    } else if (type == bp_Week_EE_en) {
        [self.bp_formatter setDateFormat:@"EE"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Week_EEEE_zh) {
        [self.bp_formatter setDateFormat:@"EEEE"];
        [self bp_Chinese];
    } else if (type == bp_Week_EEEE_en) {
        [self.bp_formatter setDateFormat:@"EEEE"];
        [self bp_HourSystem_12_24];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 公元

- (NSString *)bp_AnnoDomini:(bp_AnnoDomini_type)type {
    if (type == bp_AnnoDomini_GG_zh) {
        [self.bp_formatter setDateFormat:@"GG"];
        [self bp_Chinese];
    } else if (type == bp_AnnoDomini_GG_en) {
        [self.bp_formatter setDateFormat:@"GG"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_AnnoDomini_GGGG) {
        [self.bp_formatter setDateFormat:@"GGGG"];
        [self bp_HourSystem_12_24];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 时

- (NSString *)bp_Hour:(bp_Hour_type)type {
    if (type == bp_Hour_h) {
        [self.bp_formatter setDateFormat:@"h aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Hour_hh) {
        [self.bp_formatter setDateFormat:@"hh aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Hour_H) {
        [self.bp_formatter setDateFormat:@"H"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Hour_HH) {
        [self.bp_formatter setDateFormat:@"HH"];
        [self bp_HourSystem_12_24];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 分

- (NSString *)bp_Minute:(bp_Minute_type)type {
    if (type == bp_Minute_m) {
        [self.bp_formatter setDateFormat:@"m"];
    } else if (type == bp_Minute_mm) {
        [self.bp_formatter setDateFormat:@"mm"];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 秒

- (NSString *)bp_Second:(bp_Second_type)type {
    if (type == bp_Second_s) {
        [self.bp_formatter setDateFormat:@"s"];
    } else if (type == bp_Second_ss) {
        [self.bp_formatter setDateFormat:@"ss"];
    } else if (type == bp_Millisecond_SSS) {
        [self.bp_formatter setDateFormat:@"SSS"];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 时分秒

- (NSString *)bp_HourMinuteSecond:(bp_HourMinuteSecond_type)type {
    if (type == bp_hms) {
        [self.bp_formatter setDateFormat:@"h:m:s aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_hmsS) {
        [self.bp_formatter setDateFormat:@"h:m:s.S aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_hmsSSS) {
        [self.bp_formatter setDateFormat:@"h:m:s.SSS aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_hhmmss) {
        [self.bp_formatter setDateFormat:@"hh:mm:ss aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_hhmmssS) {
        [self.bp_formatter setDateFormat:@"hh:mm:ss.S aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_hhmmssSSS) {
        [self.bp_formatter setDateFormat:@"hh:mm:ss.SSS aa"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_Hms) {
        [self.bp_formatter setDateFormat:@"H:m:s"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_HmsS) {
        [self.bp_formatter setDateFormat:@"H:m:s.S"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_HmsSSS) {
        [self.bp_formatter setDateFormat:@"H:m:s.SSS"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_HHmmss) {
        [self.bp_formatter setDateFormat:@"HH:mm:ss"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_HHmmssS) {
        [self.bp_formatter setDateFormat:@"HH:mm:ss.S"];
        [self bp_HourSystem_12_24];
    } else if (type == bp_HHmmssSSS) {
        [self.bp_formatter setDateFormat:@"HH:mm:ss.SSS"];
        [self bp_HourSystem_12_24];
    }
    return [self.bp_formatter stringFromDate:self];
}

#pragma mark - 通过 字符串 转 NSDate

#pragma mark - 获取某一年第一秒的 NSDate

/** yy 30 = 2030  60 = 1960   1951 - 2049 */
+ (NSDate *)bp_From_Year_yy:(NSString *)yy {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy"];
    NSDate *date = [formatter dateFromString:yy];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    
    return date;
}
/** yyyy */
+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSDate *date = [formatter dateFromString:yyyy];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    
    return date;
}

#pragma mark - 获取 某一年某一月 第一秒的 NSDate

+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy Month_type:(bp_Month_Type)type Month_str:(NSString *)month {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (type == bp_Month_M) {
        // yyyy M      2017  8
        [formatter setDateFormat:@"yyyy M"];
    } else if (type == bp_Month_MM) {
        // yyyy MM     2017  08
        [formatter setDateFormat:@"yyyy MM"];
    } else if (type == bp_Month_MMM_zh) {
        // yyyy MMM    中文   2017 8月
        [formatter setDateFormat:@"yyyy MMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (type == bp_Month_MMM_en) {
        // yyyy MMM    英文   2017 Aug
        [formatter setDateFormat:@"yyyy MMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else if (type == bp_Month_MMMM_zh) {
        // yyyy MMMM   中文   2017 八月
        [formatter setDateFormat:@"yyyy MMMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (type == bp_Month_MMMM_en) {
        // yyyy MMMM   英文   2017 August
        [formatter setDateFormat:@"yyyy MMMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else {
        [formatter setDateFormat:@"yyyy MM"];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    
    [formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@",yyyy,month]];
    
    return date;
}

#pragma mark - 获取 某一年某一月某一天 第一秒的 NSDate

+ (NSDate *)bp_From_Year_yyyy:(NSString *)yyyy Month_type:(bp_Month_Type)month_type Month_str:(NSString *)month Day_type:(bp_Day_Type)day_type Day_str:(NSString *)day {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSMutableString *dateFormat = [NSMutableString stringWithString:@"yyyy "];
    
    if (month_type == bp_Month_M) {
        [dateFormat appendString:@"M "];
    } else if (month_type == bp_Month_MM) {
        [dateFormat appendString:@"MM "];
    } else if (month_type == bp_Month_MMM_zh) {
        [dateFormat appendString:@"MMM "];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (month_type == bp_Month_MMM_en) {
        [dateFormat appendString:@"MMM "];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else if (month_type == bp_Month_MMMM_zh) {
        [dateFormat appendString:@"MMMM "];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (month_type == bp_Month_MMMM_en) {
        [dateFormat appendString:@"MMMM "];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else {
        [dateFormat appendString:@"MM "];
    }
    
    if (day_type == bp_Day_d) {
        [dateFormat appendString:@"d"];
    } else if (day_type == bp_Day_dd) {
        [dateFormat appendString:@"dd"];
    } else {
        [dateFormat appendString:@"dd"];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    
    [formatter setDateFormat:dateFormat];
    [formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@ %@",yyyy,month,day]];
    
    return date;
}

#pragma mark - 转换当前时间 字符串 为 NSDate

+ (NSDate *)bp_From_Month_type:(bp_Month_Type)month_type Day_type:(bp_Day_Type)day_type DateInterval_type:(bp_DateInterval_type)DI_type HourMinuteSecond_type:(bp_HourMinuteSecond_type)hms_type DateString:(NSString *)str {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSMutableString *dateFormat = [NSMutableString string];
    
    if (DI_type == bp_DateInterval_ShortHorizontalLine) {
        [dateFormat appendString:@"yyyy-"];
    } else {
        [dateFormat appendString:@"yyyy "];
    }
    
    if (month_type == bp_Month_M) {
        [dateFormat appendString:@"M"];
    } else if (month_type == bp_Month_MM) {
        [dateFormat appendString:@"MM"];
    } else if (month_type == bp_Month_MMM_zh) {
        [dateFormat appendString:@"MMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (month_type == bp_Month_MMM_en) {
        [dateFormat appendString:@"MMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else if (month_type == bp_Month_MMMM_zh) {
        [dateFormat appendString:@"MMMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    } else if (month_type == bp_Month_MMMM_en) {
        [dateFormat appendString:@"MMMM"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    } else {
        [dateFormat appendString:@"MM"];
    }
    
    if (DI_type == bp_DateInterval_ShortHorizontalLine) {
        [dateFormat appendString:@"-"];
    } else {
        [dateFormat appendString:@" "];
    }
    
    if (day_type == bp_Day_d) {
        [dateFormat appendString:@"d "];
    } else {
        [dateFormat appendString:@"dd "];
    }
    
    if (hms_type == bp_hms) {
        [dateFormat appendString:@"h:m:s"];
    } else if (hms_type == bp_hmsS) {
        [dateFormat appendString:@"h:m:s.S"];
    } else if (hms_type == bp_hmsSSS) {
        [dateFormat appendString:@"h:m:s.SSS"];
    } else if (hms_type == bp_hhmmss) {
        [dateFormat appendString:@"hh:mm:ss"];
    } else if (hms_type == bp_hhmmssS) {
        [dateFormat appendString:@"hh:mm:ss.S"];
    } else if (hms_type == bp_hhmmssSSS) {
        [dateFormat appendString:@"hh:mm:ss.SSS"];
    } else if (hms_type == bp_Hms) {
        [dateFormat appendString:@"H:m:s"];
    } else if (hms_type == bp_HmsS) {
        [dateFormat appendString:@"H:m:s.S"];
    } else if (hms_type == bp_HmsSSS) {
        [dateFormat appendString:@"H:m:s.SSS"];
    } else if (hms_type == bp_HHmmss) {
        [dateFormat appendString:@"HH:mm:ss"];
    } else if (hms_type == bp_HHmmssS) {
        [dateFormat appendString:@"HH:mm:ss.S"];
    } else if (hms_type == bp_HHmmssSSS) {
        [dateFormat appendString:@"HH:mm:ss.SSS"];
    } else {
        [dateFormat appendString:@"HH:mm:ss"];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    
    [formatter setDateFormat:dateFormat];
    [formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:[NSString stringWithString:str]];
    
    return date;
}

@end
