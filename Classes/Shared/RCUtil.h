//
//  RCUtil.h
//  oh-my-category
//
//  Created by RoCry on 6/10/13.
//  Copyright (c) 2013 FeN. All rights reserved.
//

extern NSString * NSStringFromBOOL(BOOL yesOrNo);

//================================================================================
// Log
//================================================================================

extern void RCSetupLog();

typedef enum RCLoggerLevel : NSUInteger {
    RCLoggerLevelError = 0,
    RCLoggerLevelWarning,
    RCLoggerLevelInfo,
    RCLoggerLevelVerbose,
    RCLoggerLevelInternal,
    
    RCLoggerLevelNum,
    RCLoggerLevelDefault = RCLoggerLevelInternal
} RCLoggerLevel;

#ifdef DEBUG

    #import <NSLogger/LoggerClient.h>

    #define LOG_DOMAIN @"com.rocry"

    #define RCLog(level, __FORMAT__, ...) \
            LogMessage(LOG_DOMAIN, RCLoggerLevelDefault, \
            (@"%s [L:%d]\n" __FORMAT__), __PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)

    #define RCLogError(__FORMAT__, ...)     RCLog(RCLoggerLevelError,__FORMAT__,##__VA_ARGS__)
    #define RCLogWarning(__FORMAT__, ...)   RCLog(RCLoggerLevelWarning,__FORMAT__,##__VA_ARGS__)
    #define RCLogInfo(__FORMAT__, ...)      RCLog(RCLoggerLevelInfo,__FORMAT__,##__VA_ARGS__)
    #define RCLogVerbose(__FORMAT__, ...)   RCLog(RCLoggerLevelVerbose,__FORMAT__,##__VA_ARGS__)
    #define RCLogInternal(__FORMAT__, ...)  RCLog(RCLoggerLevelInternal,__FORMAT__,##__VA_ARGS__)

    #define RCLogDefault(__FORMAT__, ...) RCLog(RCLoggerLevelDefault,__FORMAT__,##__VA_ARGS__)
    #define RCLogImageData(__DATA__, __WIDTH__, __HEIGHT__) LogImageData(LOG_DOMAIN, LOG_DEFAULT_LEVEL, __WIDTH__, __HEIGHT__, __DATA__)

#else

    #define RCLog(...)

    #define RCLogError(...)
    #define RCLogWarning(...)
    #define RCLogInfo(...)
    #define RCLogVerbose(...)
    #define RCLogInternal(...)

    #define RCLogDefault(...)
    #define RCLogImageData(...)

#endif