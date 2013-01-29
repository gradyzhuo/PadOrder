//
//  SuggestViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRViewController.h"
#import "DishDataTableView.h"
#import "SuggestDataTableController.h"
#import "DishDataModelController.h"
#import "DishDataTableViewController.h"

@interface SuggestViewController : SRViewController {
    //DishDataTableViewController *dataTableController;
    SuggestDataTableController *dataTableController;
}

@property (nonatomic, retain) IBOutlet DishDataTableView *tableView;

@end
