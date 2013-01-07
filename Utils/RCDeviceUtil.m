//
//  RCDeviceUtil.m
//  Zergling
//
//  Created by RoCry on 1/7/13.
//  Copyright (c) 2013 renren. All rights reserved.
//

#import "RCDeviceUtil.h"

@implementation RCDeviceUtil

#pragma mark - Device Identification

+ (BOOL)systemVersionGreaterThanOrEqualTo:(CGFloat)version
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= version;
}

+ (BOOL)isDeviceWithFourInchDisplay
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone && [[UIScreen mainScreen] bounds].size.height == 568);
}

@end
