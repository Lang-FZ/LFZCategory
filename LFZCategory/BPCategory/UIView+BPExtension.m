//
//  UIView+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/22.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "UIView+BPExtension.h"

@implementation UIView (BPExtension)

/** 绘制直线连接图  添加在drawRect方法内部   strokeColor线条颜色 fillColor填充颜色 width线宽 lineCap线条拐角 lineJoin终点处理 pointArr连接点数组 */
- (void)bp_DrawRectLineWithStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor withLineWidth:(double)width withLineCapStyle:(CGLineCap)lineCap withLineJoinStyle:(CGLineJoin)lineJoin withPointArr:(NSArray <NSValue *>*)pointArr {
    
    //线条颜色
    [strokeColor setStroke];
    [fillColor setFill];
    
    //创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = width;
    //线条拐角
    path.lineCapStyle = lineCap;//kCGLineCapButt
    //终点处理
    path.lineJoinStyle = lineJoin;//kCGLineJoinMiter
    
    for (int i = 0; i < pointArr.count; i++) {
        if (i == 0) {
            [path moveToPoint:pointArr[i].CGPointValue];
        } else {
            [path addLineToPoint:pointArr[i].CGPointValue];
        }
    }
    [path closePath];
    //根据坐标点连线
    
    [path fill];
    [path stroke];
}

@end
