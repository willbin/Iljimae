//
//  CrackTableViewController.m
//  Iljimae
//
//  Created by FAULTYCLONES on 23/11/2012.
//  Copyright (c) 2012 FAULTYCLONES. All rights reserved.
//

#import "CrackTableViewController.h"
#import "Application.h"
#import "UITableViewCellCrackTableCell.h"
#import <QuartzCore/QuartzCore.h>
#import "crack.h"
#import "UITableViewCellCrackTableCell.h"
#import "CrackedApplication.h"

NSString const *path = @"/var/root/Documents/Cracked";

@interface CrackTableViewController ()

@end

@implementation CrackTableViewController

@synthesize appList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(crackPressed:) name:@"crackEvent" object:nil];
        
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:@"/var/root/Documents/Cracked" error:nil];
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self ENDSWITH '.ipa'"];
    NSArray *ipaFiles = [directoryContents filteredArrayUsingPredicate:filter];
    
    NSMutableArray *unsortedArray = [[NSMutableArray alloc] init];
    for (int i=0;i<[ipaFiles count]; i++)
    {
        Application *application = [[Application alloc] initWithIPAFileAtPath:[ipaFiles objectAtIndex:i]];
        [unsortedArray addObject:application];
    }
    
    [appList sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];*/
    
    NSFileManager *fm = [NSFileManager defaultManager];
    appList = [fm contentsOfDirectoryAtPath:path error:nil];
    
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                     message:[NSString stringWithFormat:@"%@", appList]
                                                    delegate:self
                                           cancelButtonTitle:@"l"
                                           otherButtonTitles:nil, nil];
    [alert show];*/
    NSLog(@"applist %@", appList);
}

-(void) crackPressed: (NSNotification*) notification {
    if ([[notification name] isEqualToString:@"crackEvent"]) {
        NSLog(@"sucessfully received notification!");
        
    }
    else {
        NSLog(@"YOLO DID NOT SWAG SO");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Crack stuff

-(void)addApplicationToTable:(Application *)application
{
    [appList addObject:application];
    [self.tableView reloadData];
}

-(BOOL)crackApplication:(Application *)application
{
    NSLog(@"Crack Called");
    return YES;
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
    return [appList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CrackTableCell";
    UITableViewCellCrackTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCellCrackTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSString *tempHolder = [appList objectAtIndex:indexPath.row];
    NSString *pathToPayload = [NSString stringWithFormat:@"%@/%@/Payload/", path, tempHolder];
    NSError *error;
    NSArray *fm = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:pathToPayload error:&error];
    NSString *pathToApp = [NSString stringWithFormat:@"%@%@", pathToPayload, [fm objectAtIndex:0]];
    

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Err" message:[NSString stringWithFormat:@"%@", pathToApp] delegate:self cancelButtonTitle:@"k" otherButtonTitles:nil, nil];
    [alert show];
    
    CrackedApplication *crackedApp = [[CrackedApplication alloc] initFromPath:pathToApp];
    
    cell.textLabel.text = crackedApp.name;
    
    //cell.textLabel.text = [appList objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
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
}

@end
