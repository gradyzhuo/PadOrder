//
//  RankingDataTableViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingDataTableViewController.h"
#import "RankingLeftTableViewCell.h"
#import "RankingRightTableViewCell.h"

@implementation RankingDataTableViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EntityRankingDish *rankingDish = [self.fetchedResultsController objectAtIndexPath:indexPath];
    static NSString *CellIdentifier = @"Cell";
    //if ((indexPath.row %2) ) { //表示奇數，放在左邊
    //    CellIdentifier = @"CellLeft";
    //}
    //else{
    //    CellIdentifier = @"CellRight";
    //}
    
    RankingTableViewCell *cell = (RankingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[RankingLeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //if ((indexPath.row %2) == 0) {
            
        //}
        //else{
        //    cell = [[[RankingRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //}
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        //if([CellIdentifier isEqualToString:@"CellRight"]){ 
          //  cell.imageView.center = CGPointMake((cell.frame.size.width - (cell.imageView.frame.//size.width/2)), cell.imageView.center.y);
//            cell.textLabel.textAlignment = UITextAlignmentRight;
  //      }
    }
    //[cell.imageView removeFromSuperview];
    cell.levelLabel.text = [NSString stringWithFormat:@"\n\n\n\n\n\n\nNO.%@",rankingDish.Ranking_Level];
    cell.titleLabel.text = rankingDish.Dish.Dish_Name;
    cell.imageView.image = [rankingDish.Dish imageForMainImageWithClip:NO];
    cell.imageView.highlightedImage = [rankingDish.Dish imageForMainImageWithClip:NO];
    cell.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    // Configure the cell...
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%d,%d",indexPath.section,indexPath.row];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
