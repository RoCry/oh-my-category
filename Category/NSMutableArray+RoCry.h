//
//  NSMutableArray+RoCry.h
//  RRCam
//
//  Created by Tian Xia on 7/3/12.
//  Copyright (c) 2012 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (RoCry)
// anObject is a simple object, key is a property in it
- (BOOL)containsObject:(id)anObject forKey:(NSString *)key;
- (void)removeObject:(id)anObject forkey:(NSString *)key;
@end
