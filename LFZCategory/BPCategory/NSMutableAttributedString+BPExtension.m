//
//  NSMutableAttributedString+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/23.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSMutableAttributedString+BPExtension.h"

@implementation NSMutableAttributedString (BPExtension)

- (NSMutableAttributedString *)bp_AppendStr:(NSString *)string color:(UIColor *)color font:(UIFont *)font {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:@{
                                      NSFontAttributeName : font,
                                      NSForegroundColorAttributeName : color
                                      } range:NSMakeRange(0, string.length)];
    [self appendAttributedString:attributedString];
    
    return self;
}

+ (instancetype)bp_String:(NSString *)string color:(UIColor *)color font:(UIFont *)font {
    return [[self alloc] initWithString:string attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName: color}];
}

+ (instancetype)bp_String:(NSString *)string color:(UIColor *)color {
    return [[self alloc] initWithString:string attributes:@{NSForegroundColorAttributeName: color}];
}

+ (instancetype)bp_String:(NSString *)string font:(UIFont *)font {
    return [[self alloc] initWithString:string attributes:@{NSFontAttributeName : font}];
}

@end
