//
//  UITableViewCellAppList.h
//  Iljimae
//
//  Created by Thomas Hedderwick on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCellAppList : UITableViewCell
{
    NSString *version;
    UILabel *versionLabel;
}

- (void)setVersion:(NSString *)_version;

@end
