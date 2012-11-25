//
//  SettingsTableViewController.h
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController <UITableViewDataSource, UITextFieldDelegate>
{
    UITextField *basicUsername, *apptrackrUsername, *apptrackrPassword;
}

@property (nonatomic, strong) UITextField *basicUsername, *apptrackrUsername, *apptrackrPassword;
@end
