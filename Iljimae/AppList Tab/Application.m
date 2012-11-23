//
//  Application.m
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "Application.h"

@implementation Application

- (id)initWithName:(NSString *)_name version:(NSString *)_version iconPath:(NSString *)_iconPath
{
    if (self = [super init]){
        name = _name;
        version = _version;
        iconPath = _iconPath;
        icon = nil;
    }
    return self;
}

- (NSString *)name
{
    return name;
}

- (NSString *)version
{
    return version;
}

- (UIImage *)icon
{
    icon = [UIImage imageWithContentsOfFile:iconPath];
    return icon;
}

- (NSString *)iconPath
{
    return iconPath;
}

@end
