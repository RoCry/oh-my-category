//
//  MacrosFunc.h
//  oh-my-category
//
//  Created by Tian Xia on 7/15/12.
//  Copyright (c) 2012 7782. All rights reserved.
//

// from https://github.com/tangqiaoboy/
#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define EMPTY_STRING        @""

#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// from end




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