//
//  POFetchedResultsTableViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/26.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POTableViewController.h"

@interface POFetchedResultsTableViewController : POTableViewController {
    NSFetchedResultsController *fetchedResultsController;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
