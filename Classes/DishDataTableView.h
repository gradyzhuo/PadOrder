//
//  DishDataTableView.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/21.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "padOrderAppDelegate.h"

@class DishDataTableViewController;
@interface DishDataTableView : UITableView <UITableViewDelegate>{
    DishDataTableViewController *dishDataTableViewController;
    //padOrderAppDelegate *applicationDelegate;
}

@property (nonatomic,retain) DishDataTableViewController *dishDataTableViewController;
//@property (nonatomic, retain) padOrderAppDelegate *applicationDelegate;

@end
