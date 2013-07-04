//
//  NSDate+RoCry.h
//  
//  Author:[FeN]RoCry
//  Blog:http://rocry.com
//  Email:crysheen@gmail.com
//
//  Created on 2012/4/7.
//  All rights unreserved.
// 

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

#import <Foundation/Foundation.h>

@interface NSDate (RoCry)
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString *)strFormat;
-(NSString *)lunarForSolar;

// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;

+(int)howManyDaysInThisMonth:(int)year month:(int)imonth;

@end
