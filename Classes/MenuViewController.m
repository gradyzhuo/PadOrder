//
//  MenuViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/5/2.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "MenuViewController.h"


@implementation MenuViewController
@synthesize tableViewController;
@synthesize tableView;
@synthesize segmentSetupController;
@synthesize segmentArray;
@synthesize dataModelController;
@synthesize searchDisplayController;
@synthesize searchTableViewController;
@synthesize toolbar;
@synthesize searchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSArray *array = [[[DishKindModelController alloc] init] segmentTitleArrayWithTypeNo:[NSNumber numberWithInt:1]];
        self.dataModelController = [[DishDataModelController alloc] init];
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.topTitleLabel.text = @"Menu";
    
    DishDataTableViewController *dishDataTableViewController = [[DishDataTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    dishDataTableViewController.menuViewController = self;
    self.tableViewController = dishDataTableViewController;
    
    self.tableViewController.tableView = self.tableView;
    self.tableView.dataSource = self.tableViewController;
    self.tableView.delegate = self.tableViewController;
    
    self.tableView.allowsSelection = NO;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.searchBar.delegate = self;
    //self.searchBar.showsSearchResultsButton = YES;
    self.searchTableViewController = [[SearchTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self.searchDisplayController.searchContentsController];
    
    self.searchDisplayController.searchResultsDelegate = self.searchTableViewController;
    self.searchDisplayController.searchResultsDataSource = self.searchTableViewController;
    self.searchTableViewController.dishDataTableViewController = dishDataTableViewController;
    self.searchTableViewController.viewController = self;
    
    
    
    self.segmentSetupController = [[padOrderSegmentSetupController alloc] initWithController:self andTableView:self.tableView];
    self.segmentSetupController.fetchedResultsController = self.tableViewController.fetchedResultsController;
    
    [segmentSetupController segmentControl:segmentControl setTitles:self.segmentArray];
    
    [self.view addSubview:self.segmentControl];


}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.searchBar.placeholder = @"搜尋餐點";
    self.searchBar.frame = CGRectMake(0, 0, 300, self.searchBar.frame.size.height);
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBar];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = searchBarItem;
    
    
    
    [self.tableView reloadData];
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

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //DishDataModelController *dataModelController = [[DishDataModelController alloc] init];
    
    self.searchTableViewController.fetchedResultsController = [self.dataModelController fetchedResultsControllerWithSearchText:searchText];
    [self.tableView reloadData];
}

- (NSFetchedResultsController *) refreshFetchedResultsControllerWithIndex:(NSInteger)index{
    
    DishDataModelController *modelController = [[DishDataModelController alloc] init];
    
    NSLog(@"%d",index);
    
    if([self.segmentArray count] > 0) {
        NSError *error;
        NSFetchedResultsController *aFetchedResultsController = [modelController fetchedResultsControllerGroupBySetWhereKindIs:[self.segmentArray objectAtIndex:index]];
        [aFetchedResultsController performFetch:&error];
        self.tableViewController.fetchedResultsController = aFetchedResultsController;
    }
    
    [self.tableView reloadData];
    [modelController release];
    return self.tableViewController.fetchedResultsController;
}

@end
