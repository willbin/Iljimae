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
    UITextField *crackerName, *apptrackrUsername, *apptrackrPassword;
    
    UIAlertView *infoAlert;
    
    UIActivityIndicatorView *apptrackrLoginActivityIndicator;
}

@property (nonatomic, strong) UITextField *crackerName, *apptrackrUsername, *apptrackrPassword;
@end
