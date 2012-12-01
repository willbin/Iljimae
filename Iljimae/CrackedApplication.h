//
//  CrackedApplication.h
//  Iljimae
//
//  Created by Thomas Hedderwick on 30/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrackedApplication : NSObject
{
    NSString *name, *version, *path;
    UIImage *icon;
    NSDictionary *info; // Info.plist ;-)
}

- (id) initFromPath:(NSString *)_path;

- (NSString *) name;
- (NSString *) version;
- (NSString *) path;
- (UIImage *) icon;

@end
