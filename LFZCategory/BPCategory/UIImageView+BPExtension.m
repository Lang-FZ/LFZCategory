//
//  UIImageView+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/21.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "UIImageView+BPExtension.h"
#import <objc/message.h>

@interface UIImageView ()

/** 当前缩放比例 */
@property NSNumber *currentScale;
/** 当前旋转弧度 */
@property NSNumber *currentRotation;

/** 上下镜像 */
@property NSNumber *upDown;             //upDown :      NO 正常  YES 已经上下翻转
/** 左右镜像 */
@property NSNumber *leftRight;          //leftRight :   NO 正常  YES 已经左右翻转

@end

@implementation UIImageView (BPExtension)

#pragma mark - setter getter

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

#pragma mark - 旋转 缩放

/** 按固定角度旋转 */
- (void)bp_RotateNumber:(float)angle {
    
    //angle 是 角度 °
    float rotation = angle / 180.0 * M_PI;
    self.currentRotation = [NSNumber numberWithFloat:rotation];
    
    self.transform = CGAffineTransformMake(self.currentScale.floatValue * cos(rotation), self.currentScale.floatValue * sin(rotation), self.currentScale.floatValue * -sin(rotation), self.currentScale.floatValue * cos(rotation), 0, 0);
}

/** 按固定值缩放 */
- (void)bp_ScaleNumber:(float)number {
    self.currentScale = [NSNumber numberWithDouble:number];
    [self bp_ScaleFunc];
}

/** 在当前缩放值基础上再缩放 */
- (void)bp_ScaleFromCurrentScaleWithNumber:(float)number {
    self.currentScale = [NSNumber numberWithDouble:self.currentScale.floatValue * number];
    [self bp_ScaleFunc];
}

/** 缩放方法 */
- (void)bp_ScaleFunc {
    self.transform = CGAffineTransformMake(self.currentScale.floatValue * cos(self.currentRotation.floatValue), self.currentScale.floatValue * sin(self.currentRotation.floatValue), self.currentScale.floatValue * -sin(self.currentRotation.floatValue), self.currentScale.floatValue * cos(self.currentRotation.floatValue), 0, 0);
}

#pragma mark - 镜像
//默认状态 upDown = NO   leftRight = NO

/** 上下镜像 */
- (void)bp_UpDownChange {
    
    if (self.upDown.boolValue) {
        
        self.upDown = [NSNumber numberWithBool:!self.upDown.boolValue];
        
        if (self.leftRight.boolValue) {
            //左右
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
        } else {
            //原
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationUp];
        }
    } else {
        
        self.upDown = [NSNumber numberWithBool:!self.upDown.boolValue];
        
        if (self.leftRight.boolValue) {
            //对角线
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationDown];
        } else {
            //上下
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
        }
    }
}

/** 左右镜像 */
- (void)bp_LeftRightChange {
    
    if (self.leftRight.boolValue) {
        
        self.leftRight = [NSNumber numberWithBool:!self.leftRight.boolValue];
        
        if (self.upDown.boolValue) {
            //上下
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
        } else {
            //原
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationUp];
        }
    } else {
        
        self.leftRight = [NSNumber numberWithBool:!self.leftRight.boolValue];
        
        if (self.upDown.boolValue) {
            //对角线
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationDown];
        } else {
            //左右
            self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
        }
    }
}

#pragma mark - 恢复初始状态

/** 恢复初始状态 */
- (void)bp_ResumeChange {
    
    self.currentScale = @1;
    self.currentRotation = @0;
    self.upDown = [NSNumber numberWithBool:NO];
    self.leftRight = [NSNumber numberWithBool:NO];
    
    self.transform = CGAffineTransformMake(1 * cos(0), 1 * sin(0), 1 * -sin(0), 1 * cos(0), 0, 0);
    self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationUp];
}

#pragma mark - 创建渐变色图片

/** 通过 bounds 整个imageView渐变 */
- (void)bp_CreateGradientColorWithBounds:(CGRect)rect withStartColor:(UIColor *)starColor withEndColor:(UIColor *)endColor {
    
    //创建CGContextRef
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    CGPathCloseSubpath(path);
    
    //绘制渐变
    [self bp_DrawLinearGradient:gc path:path startColor:starColor.CGColor endColor:endColor.CGColor];
    
    //注意释放CGMutablePathRef
    CGPathRelease(path);
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = img;
}

/** 通过 pointArr 订制多边形渐变 */
- (void)bp_CreateGradientColorWithPointArr:(NSArray <NSValue *>*)pointArr withStartColor:(UIColor *)starColor withEndColor:(UIColor *)endColor {
    
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    
    for (int i = 0; i < pointArr.count; i++) {
        
        NSValue *value = pointArr[i];
        CGPoint point = value.CGPointValue;
        
        if (i == 0) {
            CGPathMoveToPoint(path, NULL, point.x, point.y);
        } else {
            CGPathAddLineToPoint(path, NULL, point.x, point.y);
        }
    }
    CGPathCloseSubpath(path);
    
    //绘制渐变
    [self bp_DrawLinearGradient:gc path:path startColor:starColor.CGColor endColor:endColor.CGColor];
    
    //注意释放CGMutablePathRef
    CGPathRelease(path);
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = img;
}

/** 绘制渐变 */
- (void)bp_DrawLinearGradient:(CGContextRef)context path:(CGPathRef)path startColor:(CGColorRef)startColor endColor:(CGColorRef)endColor {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
