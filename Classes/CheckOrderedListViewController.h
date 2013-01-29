//
//  CheckOrderedListViewController.h
//  padorder
//
//  Created by Zhuo Ting-Rui on 2011/5/3.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSliderViewController.h"
#import "OrderedListViewController.h"
#import "CheckOrderedTableViewController.h"

@interface CheckOrderedListViewController : POSliderViewController {
    UIButton *sureButton;
    OrderedListViewController *orderedListViewController;
    UITableView *tableView;
    CheckOrderedTableViewController *tableViewController;
    UILabel *priceLabel;
}

@property (nonatomic, retain) IBOutlet UIButton *sureButton;
@property (nonatomic, retain) OrderedListViewController *orderedListViewController;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) CheckOrderedTableViewController *tableViewController;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;

- (IBAction) sureCheck:(id)sender;

@end
