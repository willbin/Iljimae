//
//  AppListTableCell.m
//  Iljimae
//
//  Created by Terence Tan on 23/11/12.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "AppListTableCell.h"

@implementation AppListTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
