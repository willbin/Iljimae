//
//  Application.h
//  Iljimae
//
//  Created by Thomas Hedderwick on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject
{
    NSString *name, *version, *iconPath;
    UIImage *icon;
}

- (NSString *)name;
- (NSString *)version;
- (UIImage *)icon;
- (NSString *)iconPath;

- (id)initWithName:(NSString *)_name version:(NSString *)_version iconPath:(NSString *)_iconPath;

@end
