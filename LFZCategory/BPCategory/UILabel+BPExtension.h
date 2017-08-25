//
//  UILabel+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/21.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BPExtension)


#pragma mark - 旋转 缩放

/** 旋转方法 angle 旋转角度 ° */
- (void)bp_RotateLabelRotation:(float)angle;
/** 按固定值缩放 labelScale 缩放数值 */
- (void)bp_ScaleLabelScale:(float)labelScale;
/** 在当前缩放值基础上再缩放 */
- (void)bp_ScaleLabelFromCurrentScaleWithNumber:(float)labelScale;


#pragma mark - 镜像

/** 上下镜像 */
- (void)bp_UpDownChange;
/** 左右镜像 */
- (void)bp_LeftRightChange;


#pragma mark - 恢复初始状态

/** 恢复初始状态 */
- (void)bp_ResumeChange;


#pragma mark - 修改文字和字体

/** 修改文字     wordSpacing 字间距    lineSpacing 行间距 */
- (void)bp_ChangeText:(NSString *)str WithFont:(UIFont *)font withWordSpacing:(float)wordSpacing withLineSpacing:(float)lineSpacing;

@end
