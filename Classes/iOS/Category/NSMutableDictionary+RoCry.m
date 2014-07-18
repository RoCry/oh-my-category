//
//  NSMutableDictionary+RoCry.m
//  GithubMobile
//
//  Created by Tian Xia on 8/4/12.
//
//

#import "NSMutableDictionary+RoCry.h"

@implementation NSMutableDictionary (RoCry)
/*
     NSDictionary *old = @{
                          @"key1":@{@"key11":@"value11",
                                    @"key12":@"value12",
                                    @"key13":@"value13"},
                          @"key2":@{@"key21":@"value21",
                                    @"key22":@"value22",
                                    @"key23":@"value23",
                                    @"key24":@"value24"}
                          };
    
    NSDictionary *new = @{
                          @"key1":@{@"key11":@"value11",
                                    @"key12":@"value12",
                                    @"key13":@"value13"},
                          @"key2":@{@"key21":@"value21",
                                    @"key22":@"value22",
                                    @"key23":@"value23"},
                          @"key3":@{@"key31":@"value31",
                                    @"key32":@"value32",
                                    @"key33":@"value33"}
                          };
    
    NSMutableDictionary *merged = [old mutableCopy];
    [merged mergeNewDictionary:new];
    NSLog(@"old = %@",old);
    NSLog(@"new = %@",new);
    NSLog(@"merged = %@",merged);
 */
- (void)mergeNewDictionary:(NSDictionary *)newDictionary;{
    [newDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![self objectForKey:key]) {
            [self setValue:obj forKey:key];
        }else if ([obj isKindOfClass:[NSDictionary class]] &&
                  [[self objectForKey:key] isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dic = [[self objectForKey:key] mutableCopy];
            [dic mergeNewDictionary:obj];
            [self setValue:dic forKey:key];
        }else {
            [self setValue:obj forKey:key];
        }
    }];
}

@end
