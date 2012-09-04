//
//  RCCoreDataUtil.m
//  oh-my-category
//
//  Created by Tian Xia on 7/11/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import "RCCoreDataUtil.h"
#import <CoreData/CoreData.h>

@implementation RCCoreDataUtil

+ (void)cleanData:(NSString *)entityDescription 
managedObjectContext:(NSManagedObjectContext *)moc{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityDescription inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *items = [moc executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items) {
        [moc deleteObject:managedObject];
    }
    if (![moc save:&error]) {
    }
}

@end
