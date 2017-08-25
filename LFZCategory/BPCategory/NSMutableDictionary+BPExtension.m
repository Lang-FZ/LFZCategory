//
//  NSMutableDictionary+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSMutableDictionary+BPExtension.h"
#import "NSObject+BPExtension.h"

@implementation NSMutableDictionary (BPExtension)

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSDictionaryM") swizzleMethod: @selector(setObject:forKey:) withMethod:@selector(bp_setObject:forKey:) error:nil];
    });
}

- (void)bp_setObject:(id)object forKey:(id<NSCopying>)key {
    
    if (!object) {
        [self bp_setObject:@"" forKey:key];
        NSLog(@"\nnull >>>>>> 请注意! NSMutableDictionary : %@ 添加值为 nil ",self);
    } else {
        [self bp_setObject:object forKey:key];
    }
}

@end
