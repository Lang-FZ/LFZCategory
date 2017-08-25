//
//  UIButton+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/18.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "UIButton+BPExtension.h"
#import <objc/message.h>

@implementation UIButton (BPExtension)

#pragma mark - bp_image         直接用 点语法 赋值默认图片

- (void)setBp_image:(NSString *)bp_image {
    
    [self setImage:[UIImage imageNamed:bp_image] forState:UIControlStateNormal];
    
    objc_setAssociatedObject(self, @"bp_image", [self imageForState:UIControlStateNormal], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)bp_image {
    return objc_getAssociatedObject(self, @"bp_image");
}


#pragma mark - bp_selectImage   直接用 点语法 赋值选中图片

- (void)setBp_selectImage:(NSString *)bp_selectImage {
    
    [self setImage:[UIImage imageNamed:bp_selectImage] forState:UIControlStateSelected];
    
    objc_setAssociatedObject(self, @"bp_selectImage", [self imageForState:UIControlStateSelected], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)bp_selectImage {
    return objc_getAssociatedObject(self, @"bp_selectImage");
}


#pragma mark - bp_title         直接用 点语法 赋值文字

- (void)setBp_title:(NSString *)bp_title {
    
    [self setTitle:bp_title forState:UIControlStateNormal];
    
    objc_setAssociatedObject(self, @"bp_title", bp_title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)bp_title {
    return objc_getAssociatedObject(self, @"bp_title");
}


#pragma mark - bp_titleColor    直接用 点语法 赋值文字颜色

- (void)setBp_titleColor:(UIColor *)bp_titleColor {
    
    [self setTitleColor:bp_titleColor forState:UIControlStateNormal];
    
    objc_setAssociatedObject(self, @"bp_titleColor", bp_titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)bp_titleColor {
    return objc_getAssociatedObject(self, @"bp_titleColor");
}

@end
