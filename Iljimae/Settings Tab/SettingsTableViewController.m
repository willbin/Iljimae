//
//  SettingsTableViewController.m
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

@synthesize basicUsername, apptrackrUsername, apptrackrPassword;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UITextField *infoButton = [[UITextField alloc] init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    } else {
        infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    }
    
    [infoButton addTarget:self action:@selector(infoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    [self.navigationItem setRightBarButtonItem:barButton];

}

- (void) infoButtonPressed
{
#warning Place your info stuff here ttwj
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) return 1;
    if (section == 1) return 2;
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Basics";
            break;
        case 1:
            return @"apptrackr";
            break;
            
        default:
            return nil;
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Your crackername to be added to apps";
            break;
        case 1:
            return @"Your apptrackr details to submit apps";
            
        default:
            return nil;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0)
    {
        // First Section in the table yo, username maybe?
        basicUsername = [[UITextField alloc] init];
        basicUsername.textColor = [UIColor blackColor];
        basicUsername.adjustsFontSizeToFitWidth = NO;
        basicUsername.autocorrectionType = UITextAutocorrectionTypeNo;
        basicUsername.autocapitalizationType = UITextAutocorrectionTypeNo;
        basicUsername.delegate = self;
        if (indexPath.row == 0){
            cell.textLabel.text = @"Username:";
            basicUsername.placeholder = @"Username";
            basicUsername.returnKeyType = UIReturnKeyDone;
                
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
                basicUsername.frame = CGRectMake(110, 12, 185, 30);
            } else {
                basicUsername.frame = CGRectMake(145, 12, 185, 30);
            }
        }
        [cell addSubview:basicUsername];
    }
    else if (indexPath.section == 1){
        
        //Second Section - Apptrackr stuff?
        apptrackrUsername = [[UITextField alloc] init];
        apptrackrUsername.textColor = [UIColor blackColor];
        apptrackrUsername.adjustsFontSizeToFitWidth = NO;
        apptrackrUsername.autocapitalizationType = UITextAutocapitalizationTypeNone;
        apptrackrUsername.autocorrectionType = UITextAutocorrectionTypeNo;
        apptrackrPassword.delegate = self;
        
        apptrackrPassword = [[UITextField alloc] init];
        apptrackrPassword.textColor = [UIColor blackColor];
        apptrackrPassword.adjustsFontSizeToFitWidth = NO;
        apptrackrPassword.autocapitalizationType = UITextAutocorrectionTypeNo;
        apptrackrPassword.autocorrectionType = UITextAutocorrectionTypeNo;
        apptrackrPassword.secureTextEntry = YES;
        apptrackrPassword.delegate = self;
        
        if (indexPath.row == 0){
            cell.textLabel.text = @"Username:";
            apptrackrUsername.placeholder = @"Username";
            apptrackrUsername.returnKeyType = UIReturnKeyDone;
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
                apptrackrUsername.frame = CGRectMake(110, 12, 185, 30);
            } else {
                apptrackrUsername.frame = CGRectMake(145, 12, 185, 30);
            }
            
            [cell addSubview:apptrackrUsername];
            
        } else if (indexPath.row == 1){
            cell.textLabel.text = @"Password:";
            apptrackrPassword.placeholder = @"Password";
            apptrackrPassword.returnKeyType = UIReturnKeyDone;
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
                apptrackrPassword.frame = CGRectMake(110, 12, 185, 30);
            } else {
                apptrackrPassword.frame = CGRectMake(145, 12, 185, 30);
            }
        }
        [cell addSubview:apptrackrPassword];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Text field delegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
#warning Store variable needed anywhere else here - needs to be decided.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if (indexPath.section == 0){
        [basicUsername becomeFirstResponder];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0){
            [apptrackrUsername becomeFirstResponder];
        } else if (indexPath.row == 1) {
            [apptrackrPassword becomeFirstResponder];
        }
    }
}

@end
