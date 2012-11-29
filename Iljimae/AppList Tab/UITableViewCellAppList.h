//
//  UITableViewCellAppList.h
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Application.h"

@interface UITableViewCellAppList : UITableViewCell
{
    NSString *version;
    UILabel *versionLabel;
    Application *_application;
}
@property (nonatomic, strong) Application *application;
- (void)setVersion:(NSString *)_version;

@end
