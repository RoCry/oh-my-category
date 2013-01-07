//
//  RCDeviceUtil.h
//  Zergling
//
//  Created by RoCry on 1/7/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCDeviceUtil : NSObject

+ (BOOL)systemVersionGreaterThanOrEqualTo:(CGFloat)version;
+ (BOOL)isDeviceWithFourInchDisplay;

@end
