//
//  MenuViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/5/2.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRViewController.h"
#import "DishDataTableViewController.h"
#import "padOrderSegmentSetupController.h"
#import "SearchTableViewController.h"
#import "AllEntity.h"
#import "AllModalController.h"

//@class DishKindModelController;

@interface MenuViewController : SRViewController <UISearchBarDelegate,UISearchDisplayDelegate>{
    DishDataModelController *dataModelController;
    DishDataTableViewController *tableViewController;
    UITableView *tableView;
    padOrderSegmentSetupController *segmentSetupController;
    NSArray *segmentArray;
    
    UISearchDisplayController *searchDisplayController;
    SearchTableViewController *searchTableViewController;
    UIToolbar *toolbar;
    UISearchBar *searchBar;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) DishDataTableViewController *tableViewController;
@property (nonatomic, retain) padOrderSegmentSetupController *segmentSetupController;
@property (nonatomic, retain) NSArray *segmentArray;
@property (nonatomic, retain) DishDataModelController *dataModelController;

@property (nonatomic, retain) IBOutlet UISearchDisplayController *searchDisplayController;
@property (nonatomic, retain) SearchTableViewController *searchTableViewController;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

- (NSFetchedResultsController *) refreshFetchedResultsControllerWithIndex:(NSInteger)index;

@end
