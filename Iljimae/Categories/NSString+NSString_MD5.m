//
//  NSString+NSString_MD5.m
//  Iljimae
//
//  Created by Thomas Hedderwick on 26/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "NSString+NSString_MD5.h"
#import <CommonCrypto/CommonDigest.h>

// Can't find the library - but it says I can still import - hm

@implementation NSString (NSString_MD5)

- (NSString *)MD5
{
    const char *ptr = [self UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", md5Buffer[i]];
    
    return output;
}

@end
