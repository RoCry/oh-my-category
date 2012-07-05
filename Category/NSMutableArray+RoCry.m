//
//  NSMutableArray+RoCry.m
//  RRCam
//
//  Created by Tian Xia on 7/3/12.
//  Copyright (c) 2012 renren. All rights reserved.
//

#import "NSMutableArray+RoCry.h"

@implementation NSMutableArray (RoCry)

- (BOOL)containsObject:(id)anObject forKey:(NSString *)key;{
    for (id obj in self) {
        if ([[anObject valueForKey:key]isEqual:[obj valueForKey:key]]) {
            return YES;
        }
    }
    return NO;
}

- (void)removeObject:(id)anObject forkey:(NSString *)key;{
    for (id obj in self) {
        if ([[anObject valueForKey:key]isEqual:[obj valueForKey:key]]) {
            [self removeObject:obj];
            return;
        }
    }
    
}

@end
