//
//  NSObject+RCRuntimeUtil.m
//  oh-my-category
//
//  Created by Summer on 13-4-3.
//  Copyright (c) 2013年 FeN. All rights reserved.
//

#import "NSObject+RCRuntimeUtil.h"

@implementation NSObject (RCRuntimeUtil)

+ (BOOL)isCopyProperty:(objc_property_t)property {
    const char * attrs = property_getAttributes( property );
    NSString *attrsString = [NSString stringWithCString:attrs encoding:NSUTF8StringEncoding];
    
    for (NSString *string in [attrsString componentsSeparatedByString:@","]) {
        if ([string isEqualToString:@"C"]) {
            return YES;
        }
    }
    return NO;

}

const char *typeOfPropertyNamed(Class objectClass,const char *name)
{
	objc_property_t property = class_getProperty(objectClass, name);
	if ( property == NULL )
		return ( NULL );
    
	return ( property_getTypeString(property) );
}

// return               T@"NSString"     Ti     Tc
const char * property_getTypeString( objc_property_t property )
{
	const char * attrs = property_getAttributes( property );
	if ( attrs == NULL )
		return ( NULL );
    
	static char buffer[256];
	const char * e = strchr( attrs, ',' );
	if ( e == NULL )
		return ( NULL );
    
	int len = (int)(e - attrs);
	memcpy( buffer, attrs, len );
	buffer[len] = '\0';
    
	return ( buffer );
}

@end
