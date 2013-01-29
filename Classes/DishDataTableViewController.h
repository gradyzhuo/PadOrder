//
//  DishDataTableViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POFetchedResultsTableViewController.h"

@class OrderedInfoModelController;
@class DishTableCellView;
@class DishDataTableView;
@class EntityDish;
@class EntityOrderedInfo;
@class EntityDishSet;
@class OrderedListViewController;
@class DishDetailViewController;
@class padOrderAppDelegate;
@class VarsBarButtomItem;
@class MoveAnimationController;
@class SetInfomationViewController;
@class DishForOrderViewController;
@class VarsButton;
@class SRViewController;

@interface DishDataTableViewController : POFetchedResultsTableViewController<UITableViewDelegate,UIActionSheetDelegate,UITableViewDataSource> {
    
    SRViewController *menuViewController;
    NSDictionary *dataDictionary;
    DishTableCellView *tableCellView;
    //DishForOrderViewController *dishMenuViewController;
    OrderedListViewController *orderedListViewController;
    UINavigationController *navigationController;
    //NSFetchedResultsController *fetchedResultsController;
    padOrderAppDelegate *appDelegate;
    MoveAnimationController *moveAnimationController;
    UIPopoverController *popoverController;
    SetInfomationViewController *setInfoViewController;
    UITextField *dishCountTextField;
    VarsButton *adderButton;
    BOOL onSearch;
}
@property (nonatomic) BOOL onSearch;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UINavigationController *navigationController;
//@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSDictionary *dataDictionary;
@property (nonatomic, retain) OrderedListViewController *orderedListViewController;
@property (nonatomic, retain) IBOutlet DishTableCellView *tableCellView;
@property (nonatomic, retain) padOrderAppDelegate *appDelegate;
@property (nonatomic, retain) MoveAnimationController *moveAnimationController;
@property (nonatomic, retain) SetInfomationViewController *setInfoViewController;
//@property (nonatomic, retain) DishForOrderViewController *dishMenuViewController;
@property (nonatomic, retain) SRViewController *menuViewController;
@property (nonatomic, retain) DishDetailViewController *detailViewController;
@property (nonatomic, retain) UITextField *dishCountTextField;
@property (nonatomic, retain) VarsButton *adderButton;

- (void) flashButton:(UIButton *)button;
- (UIImage *) cuttingPictureForCellFormat:(UIImage *)image;
- (void) showSetScetionInfo:(id)sender;
- (void) buttonAction:(id)sender;
- (void) buttonDetail:(id)sender;
- (void) reloadTableViewAfterAnimationWithIndexPath:(NSIndexPath *)indexPath;
- (void) setCellWhenNil:(DishTableCellView *)cell;
- (NSIndexPath *) addOrderDish:(EntityDish *)dish withOrderedListAnimation:(BOOL)animation count:(NSInteger)count;

@end
