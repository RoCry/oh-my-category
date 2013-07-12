//
//  NSURL+RoCry.m
//  TestSomething
//
//  Created by RoCry on 10/19/12.
//  Copyright (c) 2012 RoCry. All rights reserved.
//

#import "NSURL+RoCry.h"

@implementation NSURL (RoCry)

- (NSDictionary *)params {
    if (self.query) {
        NSArray *keyValues = [self.query componentsSeparatedByString:@"&"];
        NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
        for (NSString *keyValue in keyValues) {
            NSArray *keyValueArray = [keyValue componentsSeparatedByString:@"="];
            [result setValue:keyValueArray[1] forKey:keyValueArray[0]];
        }
        return [result copy];
    }
    return nil;
}

@end
