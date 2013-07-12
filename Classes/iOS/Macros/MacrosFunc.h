//
//  MacrosFunc.h
//  oh-my-category
//
//  Created by Tian Xia on 7/15/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

// from https://github.com/tangqiaoboy/
#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// from tangqiao end

//================================================================================
// Common
//================================================================================

#ifdef DEBUG
#define DLog(fmt,...) NSLog((@"%s [Line %d] " fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define DLog(...)
#endif

// define a way to quickly grab the app delegate
#define TheAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate

#define RUN_AFTER(delay_time) \
dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, delay_time * NSEC_PER_SEC); \
dispatch_after(startTime, dispatch_get_main_queue(), ^(void){
// the delay running code
#define RUN_AFTER_END });

//================================================================================
// Detect device idioms
//================================================================================

#define DEVICE_IS_IPHONE_IDIOM  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define DEVICE_IS_IPAD_IDIOM    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// Detect "widescreen" devices (iPhone 5 or iPod Touch 4).
#define DEVICE_IS_WIDESCREEN (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON)

//================================================================================
// Detect version
//================================================================================

#define FUNCTION_REQUIRED_IOS_VERSION_BEGIN(version) \
{ \
NSString *currentVersion = [[UIDevice currentDevice] systemVersion]; \
if ([currentVersion compare:@#version] == NSOrderedDescending || [currentVersion compare:@#version] == NSOrderedSame) {
#define FUNCTION_REQUIRED_IOS_VERSION_ELSE_IF_LOWER } else{
#define FUNCTION_REQUIRED_IOS_VERSION_ELSE_IF_LOWER_END }}

// sample :
/*
 FUNCTION_REQUIRED_IOS_VERSION_BEGIN(5.0)
 // some code here
 FUNCTION_REQUIRED_IOS_VERSION_ELSE_IF_LOWER
 // other code here
 FUNCTION_REQUIRED_IOS_VERSION_ELSE_IF_LOWER_END
 */