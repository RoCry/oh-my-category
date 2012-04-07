//
//  NSDate+ChineseBirth.h
//  
//  Author:[FeN]RoCry
//  Blog:http://rocry.com
//  Email:crysheen@gmail.com
//
//  Created on 2012/4/7.
//  All rights unreserved.
//  

#import <Foundation/Foundation.h>

@interface NSDate (ChineseBirth)

@property (readonly) NSInteger lunarDay;
@property (readonly) NSInteger lunarMonth;
@property (readonly) NSInteger lunarYear;

-(NSInteger)nextLunarBirthNumWithSolarDate;

-(NSDate *)nextLunarBirthDateWithSolarDate;

+ (void)test;

@end
