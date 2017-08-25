//
//  NSMutableAttributedString+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/23.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (BPExtension)

- (NSMutableAttributedString *)bp_AppendStr:(NSString *)string color:(UIColor *)color font:(UIFont *)font;

+ (instancetype)bp_String:(NSString *)string color:(UIColor *)color font:(UIFont *)font;

+ (instancetype)bp_String:(NSString *)string color:(UIColor *)color;

+ (instancetype)bp_String:(NSString *)string font:(UIFont *)font;

@end
