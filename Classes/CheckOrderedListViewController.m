//
//  CheckOrderedListViewController.m
//  padorder
//
//  Created by Zhuo Ting-Rui on 2011/5/3.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "CheckOrderedListViewController.h"
#import "OrderedTableViewController.h"
#import "OrderedInfoModelController.h"

@implementation CheckOrderedListViewController
@synthesize sureButton;
@synthesize orderedListViewController;
@synthesize tableView;
@synthesize tableViewController;
@synthesize priceLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tableViewController = [[CheckOrderedTableViewController alloc] initWithStyle:UITableViewStylePlain];
        NSFetchedResultsController *fetchedResultsController = [[[OrderedInfoModelController alloc] init] fetchedDishSelectStatus:0 withSection:nil];
        //NSLog(@"%@",fetchedResultsController);
        self.tableViewController.fetchedResultsController = fetchedResultsController;
    }
    return self;
}

- (IBAction) sureCheck:(id)sender{
    [self.orderedListViewController.orderedTableViewController sendOrderingList];
    //[self.orderedListViewController showSegment:YES];
    [self hideView:sender];
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
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self.tableViewController;
    self.tableView.delegate = self.tableViewController;
    
    self.tableView.layer.masksToBounds = YES;
    self.tableView.layer.cornerRadius = 20;
    self.tableView.layer.borderWidth = 5;
    self.tableView.layer.borderColor = [[UIColor brownColor] CGColor];
    
    self.imageBgView.image = [self imageWithShadow:self.imageBgView.image];
    self.priceLabel.text = self.orderedListViewController.totalPriceLabel.text;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    NSLog(@"ROTE?");
	return YES;
}


@end
