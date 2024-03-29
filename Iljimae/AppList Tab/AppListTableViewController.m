//
//  AppListTableViewController.m
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "AppListTableViewController.h"

#import "appList.h"

#import "Application.h"

#import "UITableViewCellAppList.h"

#import <QuartzCore/QuartzCore.h>

#import "CrackTableViewController.h"

#import "crack.h"

@implementation AppListTableViewController

@synthesize appList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
 
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*NSArray *appListTemp = get_application_list(true);
    
    for(int i=0; i<[appListTemp count]; i++)
    {
        NSDictionary *dict = [appListTemp objectAtIndex:i];
        
        Application *app = [[Application alloc] initWithApplicationDirectory:[dict objectForKey:@"ApplicationDirectory"] baseName:[dict objectForKey:@"ApplicationBaseDirectory"] name:[dict objectForKey:@"ApplicationDisplayName"] version:[dict objectForKey:@"ApplicationVersion"] iconPath:@"ApplicationIcon"];
        
        [appList insertObject:app atIndex:i];
    }*/
    
    appList = get_application_list(YES);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSString *)crackApplication:(Application*)application
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *ipapath = crack_application([application applicationBasename], [application applicationDirectory]);
        dispatch_async(dispatch_get_main_queue(), ^{
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"number of rows %d", [self.appList count]);
    return [self.appList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCellAppList *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCellAppList alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    //Configure cell to your liking, note the Application class
    NSDictionary *dict = [appList objectAtIndex:indexPath.row];
    //Application *app = [appList objectAtIndex:indexPath.row];
    
    Application *app = [[Application alloc] initWithApplicationDirectory:[dict objectForKey:@"ApplicationDirectory"] baseName:[dict objectForKey:@"ApplicationBaseDirectory"] name:[dict objectForKey:@"ApplicationDisplayName"] version:[dict objectForKey:@"ApplicationVersion"] iconPath:[dict objectForKey:@"ApplicationIcon"]];
    
    if([app icon] == nil){
        cell.imageView.image = [UIImage imageNamed:@"AppPlaceholder.png"];
    } else {
        [cell.imageView.layer setCornerRadius:5.0];
        [cell.imageView.layer setMasksToBounds:YES];
        [cell setNeedsLayout];
        cell.imageView.image = [app icon];
    }
    cell.textLabel.text = [app name];
    cell.detailTextLabel.text = [app version];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.application = app;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*UITableViewCellAppList* cell = (UITableViewCellAppList*) [self.tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"crackEvent called!");
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:cell forKey:@"cell"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"crackEvent" object:self userInfo:userInfo];*/
    // Navigation logic may go here. Create and push another view controller.
    
    UITableViewCellAppList *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"calling switch view notifcation");
    NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:1], @"index", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchView" object:self userInfo:userInfo];
    NSLog(@"calling crack notification");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"crackEvent" object:self];
    /*(dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self crackApplication:cell.application];
    });*/
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

@end
