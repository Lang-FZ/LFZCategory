//
//  NSMutableArray+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSMutableArray+BPExtension.h"
#import "NSObject+BPExtension.h"

@implementation NSMutableArray (BPExtension)

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    
        [objc_getClass("__NSArrayM") swizzleMethod: @selector(objectAtIndex:) withMethod:@selector(bp_objectAtIndex:) error:nil];
        [objc_getClass("__NSArrayM") swizzleMethod: @selector(addObject:) withMethod:@selector(bp_addObject:) error:nil];
    });
}

- (id)bp_objectAtIndex:(NSUInteger)index {
    
    if (index < self.count) {
        return [self bp_objectAtIndex:index];
    }
    NSLog(@"\n>>>>>> 请注意! NSMutableArray : %@ index = %ld 数组越界",self,index);
    
    return nil;//越界返回为nil
}

- (void)bp_addObject:(id)object {
    
    if (!object) {
        [self bp_addObject:@""];
        NSLog(@"\nnull >>>>>> 请注意! NSMutableArray : %@ 添加值为 nil ",self);//  __FILE__  __FUNCTION__  __LINE__
    } else { 
        [self bp_addObject:object];
    }
}

@end
