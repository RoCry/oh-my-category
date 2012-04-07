//
//  NSDate+ChineseBirth.m
//  
//  Author:[FeN]RoCry
//  Blog:http://rocry.com
//  Email:crysheen@gmail.com
//
//  Created on 2012/4/7.
//  All rights unreserved.
//  

#import "NSDate+ChineseBirth.h"
#import "NSDate+RoCry.h"
#import "SolarDate.h"
#import "ChineseDate.h"
#import "ChineseCalendarDB.h"

@implementation NSDate (ChineseBirth)


// 输入阳历生日, 返回农历生日还有多少天
-(NSInteger)nextLunarBirthNumWithSolarDate{
    return [[self nextLunarBirthDateWithSolarDate]timeIntervalSinceNow] / D_DAY;
}

// 输入阳历生日, 返回下一个农历生日的日期
-(NSDate *)nextLunarBirthDateWithSolarDate{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [cal components:DATE_COMPONENTS fromDate:self];
//    NSLog(@"%d,%d,%d",[comps year],[comps month],[comps day]);
    
    // 转换成c++的类来计算, 先得到输入日期的阴历
    SolarDate tmpSolarDate = SolarDate([comps year], [comps month], [comps day]);
    ChineseDate chineseDate;
    tmpSolarDate.ToChineseDate(chineseDate);
    
    // 由于转换成阴历之后月的数值范围是1~13, 所以这里要处理成12月制的, 生成一个月份的偏移量来来得到真实的月份
    // 标记一种特殊的情况:生的那年生日在闰月而且下个生日也是闰月, e.g. a年和b年都是闰6月
    int deltaMonthOld= 0;
    int leapMonthOld = ChineseCalendarDB::GetLeapMonth([comps year]);
    if (leapMonthOld !=0 && (chineseDate.GetMonth() - leapMonthOld > 0)) {
        deltaMonthOld = 1;
    }
    // 真实的月份, 比如我是xx年7月(阴历6月)出生, 假设当年是闰4月, 那么这个chineseDate.GetMonth()的数值会等于7, realMonth是6
    int realMonth = chineseDate.GetMonth() - deltaMonthOld;
    
    // 说明在当年是特殊情况
    bool specialOld = (realMonth == leapMonthOld);
    int nowYear = [[NSDate date]lunarYear];
    
//    NSLog(@"%d,%d,%d",chineseDate.GetYear(),chineseDate.GetMonth(),chineseDate.GetDay());
    
    NSDate *resultDate;
    int deltaYear = 0; //年份偏移, 如果今年的生日已经过了, 那么就会+1再算一遍
    do {
        int deltaMonthNew = 0;
        ChineseDate nextChineseDate;
        int leapMonthNew = ChineseCalendarDB::GetLeapMonth(nowYear + deltaYear);
        if (leapMonthNew != 0 && (realMonth - leapMonthNew > 0)) {
            deltaMonthNew = 1;
        }
        
        // 如果这种特殊情况发生了 e.g. 当年我是第二个6月出生的, 那么chineseDate.GetMonth()是7, 这时候我还是7的时候的生日
        bool specialNew = (leapMonthNew == realMonth);
        if (specialNew && specialOld) {
            nextChineseDate = ChineseDate(nowYear + deltaYear, chineseDate.GetMonth(), chineseDate.GetDay());
        }else {
            nextChineseDate = ChineseDate(nowYear + deltaYear, realMonth + deltaMonthNew, chineseDate.GetDay());
        }
        SolarDate nextSolarDate = nextChineseDate.ToSolarDate();
        //    NSLog(@"%d,%d,%d",nextSolarDate.GetYear(),nextSolarDate.GetMonth(),nextSolarDate.GetDay());
        
        comps.year = nextSolarDate.GetYear();
        comps.month = nextSolarDate.GetMonth();
        comps.day = nextSolarDate.GetDay();
        
        resultDate  = [cal dateFromComponents:comps];
        deltaYear++;
    } while ([resultDate timeIntervalSinceNow] < 0);

    return resultDate;
}

#pragma mark -
#pragma mark 

- (NSInteger) lunarDay
{
	NSDateComponents *comps = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    SolarDate tmpSolarDate = SolarDate([comps year], [comps month], [comps day]);
	return tmpSolarDate.GetDay();
}

- (NSInteger) lunarMonth
{
	NSDateComponents *comps = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
	SolarDate tmpSolarDate = SolarDate([comps year], [comps month], [comps day]);
	return tmpSolarDate.GetMonth();
}

- (NSInteger) lunarYear
{
	NSDateComponents *comps = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
	SolarDate tmpSolarDate = SolarDate([comps year], [comps month], [comps day]);
	return tmpSolarDate.GetYear();
}

+ (void)test{
    SolarDate tmpSolarDate = SolarDate(1988, 1, 27);
    ChineseDate chineseDate;
    tmpSolarDate.ToChineseDate(chineseDate);
    NSLog(@"%d,%d,%d",chineseDate.GetYear(),chineseDate.GetMonth(),chineseDate.GetDay());
}

@end
