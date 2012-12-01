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
    
    appList = get_application_list(true);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    /*UITableViewCellAppList *cell = [tableView dequeueReusableCellWithIdentifier:@"AppListTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCellAppList alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AppListTableCell"];
    }*/
    
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCellAppList *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCellAppList alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    //Configure cell to your liking, note the Application class
        
    NSDictionary *dict = [self.appList objectAtIndex:indexPath.row];
    
    Application *app = [[Application alloc] initWithApplicationDirectory:[dict objectForKey:@"ApplicationDirectory"] baseName:[dict objectForKey:@"ApplicationBaseDirectory"] name:[dict objectForKey:@"ApplicationDisplayName"] version:[dict objectForKey:@"ApplicationVersion"] iconPath:@"ApplicationIcon"];
    
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
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

@end
