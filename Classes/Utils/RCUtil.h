//
//  RCUtil.h
//  oh-my-category
//
//  Created by RoCry on 6/10/13.
//  Copyright (c) 2013 7782. All rights reserved.
//

extern NSString * NSStringFromBOOL(BOOL yesOrNo);

//================================================================================
// Log
//================================================================================

extern void RCSetupLog();

typedef enum LoggerLevel : NSUInteger {
    LoggerLevelError = 0,
    LoggerLevelWarning,
    LoggerLevelInfo,
    LoggerLevelVerbose,
    LoggerLevelInternal,
    LoggerLevelNum
} LoggerLevel;

#ifdef DEBUG

    #import <NSLogger/LoggerClient.h>

    #define LOG_DOMAIN @"com.rocry"
    #define LOG_DEFAULT_LEVEL LoggerLevelInternal

    #define RCLog(level, __FORMAT__, ...) \
            LogMessage(LOG_DOMAIN, LOG_DEFAULT_LEVEL, \
            (@"%s [L:%d]\n" __FORMAT__), __PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
    #define RCDefaultLog(__FORMAT__, ...) RCLog(LOG_DEFAULT_LEVEL,__FORMAT__,##__VA_ARGS__)
    #define RCLogImageData(__DATA__, __WIDTH__, __HEIGHT__) LogImageData(LOG_DOMAIN, LOG_DEFAULT_LEVEL, __WIDTH__, __HEIGHT__, __DATA__)

#else

    #define RCLog(...)
    #define RCDefaultLog(...)
    #define RCLogImageData(...)

#endif