//
//  AppListTableCell.h
//  Iljimae
//
//  Created by Terence Tan on 23/11/12.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppListTableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *appName;
@property (nonatomic, strong) IBOutlet UILabel *appVersion;
@property (nonatomic, strong) IBOutlet UIImageView *appImage;

@end
