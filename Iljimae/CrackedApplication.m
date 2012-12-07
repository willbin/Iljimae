//
//  CrackedApplication.m
//  Iljimae
//
//  Created by Thomas Hedderwick on 30/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "CrackedApplication.h"

@implementation CrackedApplication

- (CrackedApplication *)initFromPath:(NSString *)_path;
{
    if(self = [super init]){
        path = _path;
    }
    
    NSString *infoPath = [path stringByAppendingString:@"/Info.plist"];
    info = [NSDictionary dictionaryWithContentsOfFile:infoPath];
    
    // Get name of the file, if it's not their fix stupid devs shit
    name = [info objectForKey:@"CFBundleDisplayName"];
    if (name == nil) name = [info objectForKey:@"CFBundleName"];
    if (name == nil) name = [info objectForKey:@"CFBundleExcutable"]; // Fuck this.
    
    // Get version, if dev is a cunt grab the ugly build number
    version = [info objectForKey:@"CFBundleShortVersionString"];
    if (version == nil) version = [info objectForKey:@"CFBundleVersion"];
    
    // Get the icon, $10 says this doesn't work
    NSArray *iconDict = [info objectForKey:@"CFBundleIconFiles"];
    int i = 0;
    //bool found = FALSE;
    NSString* iconPath;
    NSLog(@"icon dictionaries %@", iconDict);
    iconPath = [NSString stringWithFormat:@"%@/%@", path, [iconDict objectAtIndex:i]]; // Item 0 should equal Icon.png
    if (![iconPath hasSuffix:@".png"]) iconPath = [iconPath stringByAppendingString:@".png"];
        //swag brah
    
    NSLog(@"%@", iconPath);
    
    // Le brute force
    
        icon = [UIImage imageWithContentsOfFile:iconPath];
    
    // Sometimes Info.plist is a bit fucked, try Icon.png
    if (icon == nil){
        iconPath = [NSString stringWithFormat:@"%@/%@", path, @"Icon.png"];
        icon = [UIImage imageWithContentsOfFile:iconPath];
    }
    
    // Sometimes apps are made by outsourced indians, try icon.png
    if (icon == nil){
        iconPath = [NSString stringWithFormat:@"%@/%@", path, @"icon.png"];
        icon = [UIImage imageWithContentsOfFile:iconPath];
    }
    
    // Fuck people who can't do shit properly.
    if (icon == nil){
        icon = [UIImage imageNamed:@"AppPlaceholder.png"];
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

- (NSString *)path
{
    return path;
}

- (UIImage *) icon
{
    return icon;
}

@end
