//
//  NSString+RoCry.h
//  GithubMobile
//
//  Created by Tian Xia on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RoCry)

// from AFNetworking
- (NSString *)base64EncodedStringFromString;

- (BOOL)isEmpty;
- (NSString *)escapeHTML;
@end
