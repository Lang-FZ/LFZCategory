//
//  NSArray+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSArray+BPExtension.h"
#import "NSObject+BPExtension.h"

@implementation NSArray (BPExtension)

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(bp_objectAtIndex:) error:nil];
    });
}

- (id)bp_objectAtIndex:(NSUInteger)index {
    
    if (index < self.count) {
        return [self bp_objectAtIndex:index];
    }
    NSLog(@"\n>>>>>> 请注意! NSArray index = %ld 数组越界",index);
    
    return nil;//越界返回为nil
}

@end
