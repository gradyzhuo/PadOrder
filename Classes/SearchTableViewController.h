//
//  SearchTableViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/26.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POFetchedResultsTableViewController.h"
#import "AllEntity.h"
#import "DishDataTableViewController.h"
#import "SRViewController.h"
#import "VarsButton.h"

@interface SearchTableViewController : POFetchedResultsTableViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate> {
    DishDataTableViewController *dishDataTableViewController;
    SRViewController *viewController;
}

@property (nonatomic, retain) DishDataTableViewController *dishDataTableViewController;
@property (nonatomic, retain) SRViewController *viewController;

@end
