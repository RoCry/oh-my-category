//
//  NSObject+RCRuntimeUtil.h
//  oh-my-category
//
//  Created by Summer on 13-4-3.
//  Copyright (c) 2013年 7782. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (RCRuntimeUtil)

+ (BOOL)isCopyProperty:(objc_property_t)property;

@end
