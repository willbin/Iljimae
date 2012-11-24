//
//  AppListTableViewController.h
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppListTableViewController : UITableViewController
{
    NSArray *appList;
}

@property (nonatomic, strong) NSArray *appList;

@end
