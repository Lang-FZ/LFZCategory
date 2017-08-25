//
//  UILabel+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/21.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "UILabel+BPExtension.h"
#import <objc/message.h>

@interface UILabel ()

/** 当前缩放比例 */
@property NSNumber *currentScale;
/** 当前旋转弧度 */
@property NSNumber *currentRotation;

/** 上下镜像 */
@property NSNumber *upDown;             //upDown :      NO 正常  YES 已经上下翻转
/** 左右镜像 */
@property NSNumber *leftRight;          //leftRight :   NO 正常  YES 已经左右翻转

@end

@implementation UILabel (BPExtension)

#pragma mark - setter getter

/** currentScale */     //当前缩放比例
- (void)setCurrentScale:(NSNumber *)currentScale {
    objc_setAssociatedObject(self, @"currentScale", currentScale, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)currentScale {
    if (objc_getAssociatedObject(self, @"currentScale") == nil) {
        objc_setAssociatedObject(self, @"currentScale", @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, @"currentScale");
}

/** currentRotation */  //当前旋转弧度
- (void)setCurrentRotation:(NSNumber *)currentRotation {
    objc_setAssociatedObject(self, @"currentRotation", currentRotation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)currentRotation {
    if (objc_getAssociatedObject(self, @"currentRotation") == nil) {
        objc_setAssociatedObject(self, @"currentRotation", @0, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, @"currentRotation");
}

/** upDown */           //upDown : NO 正常  YES 已经上下翻转
- (void)setUpDown:(NSNumber *)upDown {
    objc_setAssociatedObject(self, @"upDown", upDown, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)upDown {
    if (objc_getAssociatedObject(self, @"upDown") == nil) {
        objc_setAssociatedObject(self, @"upDown", [NSNumber numberWithBool:NO], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, @"upDown");
}

/** leftRight */        //leftRight : NO 正常  YES 已经左右翻转
- (void)setLeftRight:(NSNumber *)leftRight {
    objc_setAssociatedObject(self, @"leftRight", leftRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)leftRight {
    if (objc_getAssociatedObject(self, @"leftRight") == nil) {
        objc_setAssociatedObject(self, @"leftRight", [NSNumber numberWithBool:NO], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, @"leftRight");
}

#pragma mark - 移动 旋转 缩放

/** 移动方法 point 相对移动point 用于手指拖拽 */
- (void)bp_MoveLabelCenterPoint:(CGPoint)point {
    
    if (self.upDown.boolValue && self.leftRight.boolValue) {
        
        self.center = CGPointMake(self.center.x + point.x * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) * cos(M_PI) - point.y * self.currentScale.doubleValue *  sin(self.currentRotation.doubleValue) * cos(M_PI), self.center.y + point.x * self.currentScale.doubleValue * sin(self.currentRotation.doubleValue) * cos(M_PI) + point.y * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) * cos(M_PI));
        
    } else if (self.upDown.boolValue) {
        
        self.center = CGPointMake(self.center.x + point.x * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) - point.y * self.currentScale.doubleValue *  sin(self.currentRotation.doubleValue), self.center.y + point.x * self.currentScale.doubleValue * sin(self.currentRotation.doubleValue) * cos(M_PI) + point.y * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) * cos(M_PI));
        
    } else if (self.leftRight.boolValue) {
        
        self.center = CGPointMake(self.center.x + point.x * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) * cos(M_PI) - point.y * self.currentScale.doubleValue * sin(self.currentRotation.doubleValue) * cos(M_PI), self.center.y + point.x * self.currentScale.doubleValue * sin(self.currentRotation.doubleValue) + point.y * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue));
        
    } else {
        
        self.center = CGPointMake(self.center.x + point.x * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) + point.y * self.currentScale.doubleValue * -sin(self.currentRotation.doubleValue), self.center.y + point.y * self.currentScale.doubleValue * cos(self.currentRotation.doubleValue) + point.x * self.currentScale.doubleValue * sin(self.currentRotation.doubleValue) );
    }
}

/** 旋转方法 angle 旋转角度 ° */
- (void)bp_RotateLabelRotation:(float)angle {
    
    float rotation = angle / 180.0 * M_PI;
    self.currentRotation = [NSNumber numberWithFloat:rotation];
    
    [self bp_SettingTransform];
}

/** 按固定值缩放 labelScale 缩放数值 */
- (void)bp_ScaleLabelScale:(float)labelScale {
    self.currentScale = [NSNumber numberWithFloat:labelScale];
    [self bp_SettingTransform];
}

/** 在当前缩放值基础上再缩放 */
- (void)bp_ScaleLabelFromCurrentScaleWithNumber:(float)labelScale {
    self.currentScale = [NSNumber numberWithDouble:self.currentScale.floatValue * labelScale];
    [self bp_SettingTransform];
}

- (void)bp_SettingTransform {
    
    if (self.upDown.boolValue && self.leftRight.boolValue) {
        
        //对角线映射
        self.transform = [self bp_ReturnTransformUpDownLeftRight];
        
    } else if (self.upDown.boolValue) {
        
        //上下映射
        self.transform = [self bp_ReturnTransformUpDown];
        
    } else if (self.leftRight.boolValue) {
        
        //左右映射
        self.transform = [self bp_ReturnTransformLeftRight];
        
    } else {
        
        //默认映射
        self.transform = [self bp_ReturnTransformNormal];
    }
}

#pragma mark - 镜像
//默认状态 upDown = NO   leftRight = NO

/** 上下镜像 */
- (void)bp_UpDownChange {

    if (self.upDown.boolValue) {
        
        self.upDown = [NSNumber numberWithBool:!self.upDown.boolValue];
        
        if (self.leftRight.boolValue) {
            //左右
            self.transform = [self bp_ReturnTransformLeftRight];
            
        } else {
            //原
            self.transform = [self bp_ReturnTransformNormal];
        }
    } else {
        
        self.upDown = [NSNumber numberWithBool:!self.upDown.boolValue];
        
        if (self.leftRight.boolValue) {
            //对角线
            self.transform = [self bp_ReturnTransformUpDownLeftRight];
            
        } else {
            //上下
            self.transform = [self bp_ReturnTransformUpDown];
        }
    }
}

/** 左右镜像 */
- (void)bp_LeftRightChange {
    
    if (self.leftRight.boolValue) {
        
        self.leftRight = [NSNumber numberWithBool:!self.leftRight.boolValue];
        
        if (self.upDown.boolValue) {
            //上下
            self.transform = [self bp_ReturnTransformUpDown];
            
        } else {
            //原
            self.transform = [self bp_ReturnTransformNormal];
        }
    } else {
        
        self.leftRight = [NSNumber numberWithBool:!self.leftRight.boolValue];
        
        if (self.upDown.boolValue) {
            //对角线
            self.transform = [self bp_ReturnTransformUpDownLeftRight];
            
        } else {
            //左右
            self.transform = [self bp_ReturnTransformLeftRight];
        }
    }
}

/** 上下镜像映射矩阵 */
- (CGAffineTransform)bp_ReturnTransformUpDown {
    return CGAffineTransformMake(
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * sin(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * -sin(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue) * cos(M_PI),
                                 0, 0);
}

/** 左右镜像映射矩阵 */
- (CGAffineTransform)bp_ReturnTransformLeftRight {
    return CGAffineTransformMake(
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * sin(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * -sin(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue),
                                 0, 0);
}

/** 对角线镜像映射矩阵 */
- (CGAffineTransform)bp_ReturnTransformUpDownLeftRight {
    return CGAffineTransformMake(
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * sin(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * -sin(self.currentRotation.floatValue) * cos(M_PI),
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue) * cos(M_PI),
                                 0, 0);
}

/** 默认镜像映射矩阵 */
- (CGAffineTransform)bp_ReturnTransformNormal {
    return CGAffineTransformMake(
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * sin(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * -sin(self.currentRotation.floatValue),
                                 self.currentScale.floatValue * cos(self.currentRotation.floatValue),
                                 0, 0);
}

#pragma mark - 恢复初始状态

/** 恢复初始状态 */
- (void)bp_ResumeChange {
    
    self.currentScale = @1;
    self.currentRotation = @0;
    self.upDown = [NSNumber numberWithBool:NO];
    self.leftRight = [NSNumber numberWithBool:NO];
    
    self.transform = CGAffineTransformMake(1 * cos(0), 1 * sin(0), 1 * -sin(0), 1 * cos(0), 0, 0);
}

#pragma mark - 修改文字和字体

/** 修改文字     wordSpacing 字间距    lineSpacing 行间距 */
- (void)bp_ChangeText:(NSString *)str WithFont:(UIFont *)font withWordSpacing:(float)wordSpacing withLineSpacing:(float)lineSpacing {
    
    CGPoint currentCenter = CGPointMake(self.center.x, self.center.y);
    NSTextAlignment currentAlignment = self.textAlignment;

    NSString *labelText = [NSString string];
    if (str.length > 0) {
        labelText = str;
    } else {
        labelText = self.text;
    }
    if (!font) {
        font = self.font;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpacing),NSFontAttributeName : font}];
    
    self.numberOfLines = 0;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = currentAlignment;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.firstLineHeadIndent = 0.0;
    paragraphStyle.paragraphSpacingBefore = 0.0;
    paragraphStyle.headIndent = 0;
    paragraphStyle.tailIndent = 0;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    self.attributedText = attributedString;
    
    CGSize size = [labelText sizeWithAttributes:@{
                                                  NSFontAttributeName : font,
                                                  NSKernAttributeName : [NSNumber numberWithFloat:wordSpacing],
                                                  NSParagraphStyleAttributeName:paragraphStyle
                                                  }];
    CGFloat testH = size.height;
    CGFloat testW = size.width;
    self.transform = CGAffineTransformIdentity;
    self.frame = CGRectMake(0, 0, testW,testH);
    self.center = currentCenter;
    
    [self bp_SettingTransform];
    
    self.adjustsFontSizeToFitWidth = YES;
//    [self sizeToFit];
}

@end
