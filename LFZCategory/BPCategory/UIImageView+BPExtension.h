//
//  UIImageView+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/21.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BPExtension)


#pragma mark - 旋转 缩放

/** 按固定角度旋转 angle 旋转角度 ° */
- (void)bp_RotateNumber:(float)angle;
/** 按固定值缩放 */
- (void)bp_ScaleNumber:(float)number;
/** 在当前缩放值基础上再缩放 */
- (void)bp_ScaleFromCurrentScaleWithNumber:(float)number;


#pragma mark - 镜像

/** 上下镜像 */
- (void)bp_UpDownChange;
/** 左右镜像 */
- (void)bp_LeftRightChange;


#pragma mark - 恢复初始状态

/** 恢复初始状态 */
- (void)bp_ResumeChange;


#pragma mark - 渐变色图片

/** 通过 bounds 整个imageView渐变 */
- (void)bp_CreateGradientColorWithBounds:(CGRect)rect withStartColor:(UIColor *)starColor withEndColor:(UIColor *)endColor;
/** 通过 pointArr 订制多边形渐变 */
- (void)bp_CreateGradientColorWithPointArr:(NSArray <NSValue *>*)pointArr withStartColor:(UIColor *)starColor withEndColor:(UIColor *)endColor;

@end
