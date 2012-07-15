//
//  RCCoreDataUtil.h
//  oh-my-category
//
//  Created by Tian Xia on 7/11/12.
//  Copyright (c) 2012 FeN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCCoreDataUtil : NSObject

+ (void)cleanData:(NSString *)entityDescription 
managedObjectContext:(NSManagedObjectContext *)moc;



@end
