//
//  UIView+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/22.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BPExtension)

/** 绘制直线连接图,添加在drawRect方法内部   strokeColor线条颜色 fillColor填充颜色 width线宽 lineCap线条拐角 lineJoin终点处理 pointArr连接点数组 */
- (void)bp_DrawRectLineWithStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor withLineWidth:(double)width withLineCapStyle:(CGLineCap)lineCap withLineJoinStyle:(CGLineJoin)lineJoin withPointArr:(NSArray <NSValue *>*)pointArr;

@end
