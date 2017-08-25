//
//  NSObject+BPExtension.h
//  iOS_BasePackage
//
//  Created by LangFZ on 2017/8/25.
//  Copyright © 2017年 LangFZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface NSObject (BPExtension)

+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;

@end
