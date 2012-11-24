//
//  UITableViewCellCrackTableCell.h
//  Iljimae
//
//  Created by Terence Tan on 24/11/12.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCellCrackTableCell : UITableViewCell

@property (nonatomic, strong) UIProgressView* progress;
@property (nonatomic, strong) UIImageView* appImage;
@property (nonatomic, strong) NSString* progressDesc;
@property (nonatomic, strong) NSString* appName;

@end
