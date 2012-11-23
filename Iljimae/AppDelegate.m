//
//  AppDelegate.m
//  Iljimae
//
//  Created by Thomas Hedderwick on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "AppDelegate.h"

#import "AppListTableViewController.h"

#import "CrackTableViewController.h"

#import "SettingsTableViewController.h"

@implementation AppDelegate
@synthesize window, tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UITableViewController *appListTVC, *crackTVC, *settingsTVC;
    UINavigationController *appListNC, *crackNC, *settingsNC;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        appListTVC = [[AppListTableViewController alloc] initWithNibName:@"AppListTableViewController_iPhone" bundle:nil];
        appListTVC.title = @"Apps";
        appListNC = [[UINavigationController alloc] initWithRootViewController:appListTVC];
        
        crackTVC = [[CrackTableViewController alloc] initWithNibName:@"CrackTableViewController_iPhone" bundle:nil];
        crackTVC.title = @"Crack";
        crackNC = [[UINavigationController alloc] initWithRootViewController:crackTVC];
        
        settingsTVC = [[SettingsTableViewController alloc] initWithNibName:@"SettingsTableViewController_iPhone" bundle:nil];
        settingsTVC.title = @"Settings";
        settingsNC = [[UINavigationController alloc] initWithRootViewController:settingsTVC];

    } else {
        appListTVC = [[AppListTableViewController alloc] initWithNibName:@"AppListTableViewController_iPad" bundle:nil];
        appListTVC.title = @"Applications";
        appListNC = [[UINavigationController alloc] initWithRootViewController:appListTVC];
        
        crackTVC = [[CrackTableViewController alloc] initWithNibName:@"CrackTableViewController_iPad" bundle:nil];
        crackTVC.title = @"Crack";
        crackNC = [[UINavigationController alloc] initWithRootViewController:crackTVC];
        
        settingsTVC = [[SettingsTableViewController alloc] initWithNibName:@"SettingsTableViewController_iPad" bundle:nil];
        settingsTVC.title = @"Settings";
        settingsNC = [[UINavigationController alloc] initWithRootViewController:settingsTVC];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:appListNC, crackNC, settingsNC, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
