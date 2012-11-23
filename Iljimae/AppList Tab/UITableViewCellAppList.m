//
//  UITableViewCellAppList.m
//  Iljimae
//
//  Created by Thomas Hedderwick on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "UITableViewCellAppList.h"

@implementation UITableViewCellAppList

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        versionLabel = [[UILabel alloc] init];
    }
    return self;
}

- (void)setVersion:(NSString *)_version
{
    version = _version;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectIntegral(CGRectMake(78, 21, 222, 21));
    
    self.imageView.frame = CGRectMake(20, 7, 50, 50);
    
    [versionLabel removeFromSuperview];
    [versionLabel setText:version];
    [versionLabel setBackgroundColor:[UIColor clearColor]];
    [versionLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [versionLabel setFrame:CGRectIntegral(CGRectMake(78, 40, [version sizeWithFont:versionLabel.font].width, [version sizeWithFont:versionLabel.font].height))];
    
    [self.contentView addSubview:versionLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
