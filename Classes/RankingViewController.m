//
//  RankingViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingViewController.h"
#import "OrderedDishModelController.h"


/*@interface UINavigationController(N) 

@end

@implementation UINavigationController(N)

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    OrderedDishModelController *test = [[OrderedDishModelController alloc] init];
    [test topRankingFromDays:5];
}

@end
*/

@implementation RankingViewController
@synthesize rankingScrollView;
@synthesize firstCrownImageView;
@synthesize firstDishImageView;
@synthesize tableView;
@synthesize tableViewController;
@synthesize segmentSetupController;
@synthesize segmentArray;
@synthesize rankingDataModelController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSArray *array = [[[[DishKindModelController alloc] init] autorelease] segmentTitleArrayWithTypeNo:[NSNumber numberWithInt:2]];
        
        self.segmentArray = array;
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

- (void)reloadTableViewWithSegment:(id)sender{
    
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.rankingDataModelController = [[RankingDataModelController alloc] init];
    self.tableViewController = [[RankingDataTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.tableViewController.fetchedResultsController = [self.rankingDataModelController fetchedRankingResultsControllerWithRankingType:0];
    
    NSLog(@"array:%@",[self.tableViewController.fetchedResultsController fetchedObjects]);
    
    //self.firstCrownImageView.transform = CGAffineTransformMakeRotation(-0.5);
    self.tableView.delegate = self.tableViewController;
    self.tableView.dataSource = self.tableViewController;
    
    self.segmentSetupController = [[padOrderSegmentSetupController alloc] initWithController:self andTableView:self.tableView];
    self.segmentSetupController.fetchedResultsController = self.tableViewController.fetchedResultsController;
    [segmentSetupController segmentControl:self.segmentControl setTitles:self.segmentArray];
    self.tableView.allowsSelection = NO;
    [self.tableView reloadData];
    
}

- (NSFetchedResultsController *) refreshFetchedResultsControllerWithIndex:(NSInteger)index{

    if([self.segmentArray count] > 0) {
        NSError *error;
        
        NSFetchedResultsController *aFetchedResultsController = [self.rankingDataModelController fetchedRankingResultsControllerWithRankingType:index];
        self.tableViewController.fetchedResultsController = aFetchedResultsController;
    }
    
    [self.tableView reloadData];
    return self.tableViewController.fetchedResultsController;
}

- (void)viewDidAppear:(BOOL)animated{
    //NSLog(@"YES");
    //[super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
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
	return YES;
}

@end
