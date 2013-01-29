//
//  RankingDataTableViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POFetchedResultsTableViewController.h"
#import "POTableViewController.h"
#import "RankingTableViewCell.h"
#import "RankingLeftTableViewCell.h"
#import "RankingRightTableViewCell.h"
#import "AllEntity.h"


@interface RankingDataTableViewController : POFetchedResultsTableViewController<UITableViewDataSource,UITableViewDelegate> {
    
}

@end
