//
//  SuggestViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "SuggestViewController.h"


@implementation SuggestViewController
@synthesize tableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataTableController = [[SuggestDataTableController alloc] initWithStyle:UITableViewStylePlain];
        
        
        //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        
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
    self.tableView.allowsSelection = NO;
    dataTableController.tableView = self.tableView;
    dataTableController.navigationController = self.navigationController;
    dataTableController.menuViewController = self;
    
    self.tableView.delegate = dataTableController;
    self.tableView.dataSource = dataTableController;
    [self.tableView reloadData];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated{
   // NSLog(@"1.%@",self.navigationController);
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
    
    //NSLog(@"2.%@",self.navigationController);
    //self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([[[(padOrderAppDelegate *)[[UIApplication sharedApplication] delegate] mainSplitViewController] view] viewWithTag:900]) {
        self.tableView.scrollEnabled = NO;
    }
}

@end
