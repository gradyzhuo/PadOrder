//
//  SearchTableViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/26.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "SearchTableViewController.h"

@implementation SearchTableViewController
@synthesize dishDataTableViewController;
@synthesize viewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EntityDish *dish = [self.fetchedResultsController objectAtIndexPath:indexPath];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@",dish.Dish_Name];
    cell.imageView.image = [dish imageForMainImageWithClip:YES];
    cell.detailTextLabel.numberOfLines = 3;
    cell.detailTextLabel.text = dish.Describe.Describe_Simple;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    VarsButton *button = [[VarsButton alloc] init];
    button.indexPath = indexPath;
    button.managerObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
    button.isDetail = YES;
    [self.dishDataTableViewController buttonDetail:button];
    self.viewController.searchDisplayController.active = NO;
    //[[self.dishForOrderViewController.searchDisplayController searchBar] setText:nil];
    //[tableView canCancelContentTouches];
    
    
    
    //[]
    //[[self.dishForOrderViewController.searchDisplayController.searchContentsController view] becomeFirstResponder];
    //[tableView removeFromSuperview];
    //NSLog(@"%@",self.dishForOrderViewController.searchDisplayController);
    //[self.dishForOrderViewController.tableView resignFirstResponder];
    //[self.dishForOrderViewController searchDisplayController:self.dishForOrderViewController.searchDisplayController didHideSearchResultsTableView:tableView];
}

@end
