//
//  NSObject+BPExtension.m
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import "NSObject+BPExtension.h"

@implementation NSObject (BPExtension)

+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error {
    
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    if (!originalMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",NSStringFromClass([self class]),NSStringFromSelector(originalSelector)];
        *error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:string forKey:NSLocalizedDescriptionKey]];
        return NO;
    }
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    
    if (!swizzledMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",NSStringFromClass([self class]),NSStringFromSelector(swizzledSelector)];
        *error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:string forKey:NSLocalizedDescriptionKey]];
        return NO;
    }
    
    if (class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    return YES;
}

@end
