//
//  Application.h
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject
{
    NSString *name, *version, *iconPath, *applicationDirectory, *applicationBasename;
    UIImage *icon;
}

- (NSString *)applicationDirectory;
- (NSString *)applicationBasename;
- (NSString *)name;
- (NSString *)version;
- (UIImage *)icon;
- (NSString *)iconPath;

- (id)initWithApplicationDirectory:(NSString *)_applicationDirectory baseName:(NSString*) _baseName name:(NSString *)_name version:(NSString *)_version iconPath:(NSString *)_iconPath;

@end
