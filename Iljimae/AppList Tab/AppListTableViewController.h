//
//  AppListTableViewController.h
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Application.h"

@interface AppListTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *appList;
}

@property (nonatomic, strong) NSArray *appList;

@end
