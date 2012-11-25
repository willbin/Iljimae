//
//  Application.m
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "Application.h"

@implementation Application

- (id)initWithApplicationDirectory:(NSString *)_applicationDirectory baseName:(NSString*)_baseName name:(NSString *)_name version:(NSString *)_version iconPath:(NSString *)_iconPath
{
    if (self = [super init]){
        applicationDirectory = _applicationDirectory;
        name = _name;
        version = _version;
        iconPath = _iconPath;
        icon = nil;
        applicationBasename = _baseName;   
        
    }
    return self;
}

- (NSString *) applicationDirectory
{
    return applicationDirectory;
}

- (NSString *)name
{
    return name;
}

- (NSString *)version
{
    return version;
}
-(NSString*) applicationBasename {
    return applicationBasename;
}

- (UIImage *)icon
{
#warning This isn't working 100% catches some instances but not others - too tired to figure out why.
    icon = [UIImage imageWithContentsOfFile:iconPath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:iconPath] == NO){
        //Stupid Developers - let's go hunting
        
        //Let's look at Info.plist first
        NSString *infoPath = [applicationDirectory stringByAppendingString:@"/Info.plist"];
        NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:infoPath];
        
        //Some devs are dicks
        NSString *iconFileName = [[info objectsForKeys:[NSArray arrayWithObject:@"CFBundleIconFile"] notFoundMarker:@"Icon.png"] lastObject];
        NSString *iconFilePath = [NSString stringWithFormat:@"%@%@", applicationDirectory, iconFileName];
        
        //Some again forget shit because they don't speak the Queen's.
        if(![iconFilePath hasSuffix:@".png"]){
            iconFilePath = [iconFilePath stringByAppendingString:@".png"];
            icon = [UIImage imageWithContentsOfFile:iconFilePath];
            NSLog(@"%@", iconFilePath);
        }
        
        //Some spell bad because they're outsourced Indians.
        if([[NSFileManager defaultManager] fileExistsAtPath:iconFilePath] == NO){
            iconFilePath = [NSString stringWithFormat:@"%@%@", applicationDirectory, @"Icon.png"];
            icon = [UIImage imageWithContentsOfFile:iconFilePath];
            NSLog(@"%@", iconFilePath);
        }
        
        //Some forget capitals
        if([[NSFileManager defaultManager] fileExistsAtPath:iconFilePath] == NO){
            iconFilePath = [NSString stringWithFormat:@"%@%@", applicationDirectory, @"icon.png"];
            icon = [UIImage imageWithContentsOfFile:iconFilePath];
            NSLog(@"%@", iconFilePath);
        }
        
        /*//Useless dev is useless give up and return a placeholder splintr provided. (Thanks splintr)
        if ([[NSFileManager defaultManager] fileExistsAtPath:iconFilePath] == NO)
        {
            icon = [UIImage imageNamed:@"AppPlaceholder"];
        }
        NSLog(@"%@", iconFilePath);*/

        
    }
    return icon;
}

- (NSString *)iconPath
{
    return iconPath;
}

@end
