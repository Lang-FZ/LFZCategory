//
//  UIButton+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/18.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BPExtension)

@property NSString *bp_image;       //直接用 点语法 赋值默认图片

@property NSString *bp_selectImage; //直接用 点语法 赋值选中图片

@property NSString *bp_title;       //直接用 点语法 赋值文字

@property UIColor *bp_titleColor;   //直接用 点语法 赋值文字颜色

@end
