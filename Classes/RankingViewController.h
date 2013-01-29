//
//  RankingViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POScrollViewController.h"
#import "SRViewController.h"
#import "POCrownImageView.h"
#import "RankingDataTableViewController.h"
#import "padOrderSegmentSetupController.h"
#import "DishKindModelController.h"
#import "RankingDataModelController.h"

@interface RankingViewController : SRViewController {
    UIScrollView *rankingScrollView;
    RankingDataModelController *rankingDataModelController;
    RankingDataTableViewController *tableViewController;
    UITableView *tableView;
    padOrderSegmentSetupController *segmentSetupController;
    NSArray *segmentArray;
}

@property (nonatomic, retain) IBOutlet UIScrollView *rankingScrollView;
@property (nonatomic, retain) IBOutlet POCrownImageView *firstCrownImageView;
@property (nonatomic, retain) IBOutlet UIImageView *firstDishImageView;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) RankingDataTableViewController *tableViewController;
@property (nonatomic, retain) padOrderSegmentSetupController *segmentSetupController;
@property (nonatomic, retain) NSArray *segmentArray;
@property (nonatomic, retain) RankingDataModelController *rankingDataModelController;

- (NSFetchedResultsController *) refreshFetchedResultsControllerWithIndex:(NSInteger)index;
- (void) reloadTableViewWithSegment:(id)sender;

@end
