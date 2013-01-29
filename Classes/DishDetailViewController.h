//
//  DishDetailViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/11/1.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POViewController.h"
#import "DishDataTableViewController.h"
#import "VarsButton.h"
#import "EntityDish.h"
#import "DishImagesModelController.h"
#import "SRViewController.h"

@interface DishDetailViewController : SRViewController {
    UINavigationBar *navigationBar;
    UIScrollView *contentScrollView;
    UIScrollView *moreImageScrollView;
    UIImageView *dishImageView;
    UILabel *dishTitle;
    UILabel *dishPrice;
    UITextView *dishDescription;
    EntityDish *introDish;
    VarsButton *addButton;
    DishDataTableViewController *tableViewController;
	NSIndexPath *indexPath;
    DishImagesModelController *imageModelController;
    SRViewController *beforeViewController;
    UIButton *backButton;
}
@property (nonatomic, retain) EntityDish *introDish;
@property (nonatomic, retain) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, retain) DishDataTableViewController *tableViewController;
@property (nonatomic, retain) IBOutlet VarsButton *addButton;
@property (nonatomic, retain) IBOutlet UILabel *dishTitle;
@property (nonatomic, retain) IBOutlet UIImageView *dishImageView;
@property (nonatomic, retain) UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UITextView *dishDescription;
@property (nonatomic, retain) IBOutlet UILabel *dishPrice;
@property (nonatomic, retain) IBOutlet UIScrollView *moreImageScrollView;
@property (nonatomic, retain) NSIndexPath *indexPath;
@property (nonatomic, retain) DishImagesModelController *imageModelController;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) SRViewController *beforeViewController;

- (IBAction) backToMenu:(id)sender;
- (BOOL) resetContentScrollFrameWithOrientation:(UIInterfaceOrientation)interfaceOrientation;
-(id)initWithDish:(EntityDish *)dish;
@end
