//
//  NSURL+RoCry.h
//  TestSomething
//
//  Created by RoCry on 10/19/12.
//  Copyright (c) 2012 RoCry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (RoCry)

/*
 NSURL *url1 = [NSURL URLWithString:@"raydv://uume.com/12345;param?foo=1&baa=2#fragment"];
 NSURL *url2 = [NSURL URLWithString:@"raydv://info?share=5739514"];
 
 NSLog(@"%@",[url1 params]);
 NSLog(@"%@",[url2 params]);

 {
    baa = 2;
    foo = 1;
 }

 {
    share = 5739514;
 }
 */

- (NSDictionary *)params;

@end
