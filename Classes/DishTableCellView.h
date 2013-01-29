//
//  DishTableCellView.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/18.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableCellViewClass.h"
#import "DishDataTableViewController.h"
#import "POAnimationController.h"
#import "PODropView.h"

@interface DishTableCellView : TableCellViewClass<UITableViewDelegate>{
    UIImage *dishImage_noshadow;
    NSString *dishTitle;
    NSString *descriptText;
    NSString *dishImageName;
    DishDataTableViewController *dataTableViewController;
    NSNumber *dishPrice;
    NSString *buttonBgPicName;
    NSString *detailButtonBgPicName;
	NSInteger hotValue;
    NSString *specifyShowText;
    BOOL isExistDishImage;
}

@property (nonatomic, retain) UIImage *dishImage_noshadow;
@property (nonatomic, retain) NSString *buttonBgPicName;
@property (nonatomic, retain) NSString *detailButtonBgPicName;
@property (nonatomic, retain) NSString *dishTitle;
@property (nonatomic, retain) NSString *dishImageName;
@property (nonatomic, retain) NSString *descriptText;
@property (nonatomic, retain) NSNumber *dishPrice;
@property (nonatomic, retain) DishDataTableViewController *dataTableViewController;
@property (nonatomic) NSInteger hotValue;
@property (nonatomic) BOOL isExistDishImage;
@property (nonatomic, retain) NSString *specifyShowText;
@property (nonatomic, retain) UILabel *dishOrderCountLabel;
@property (nonatomic, retain) UILabel *dishNameLabel;
@property (nonatomic) NSInteger orderCount;
//- (void) setDishPicture:(NSString *)imageName;
//- (void) setSubmitButton:(NSString *)normal onPressed:(NSString *)pressed;
- (void) tableViewEnableScroll;
- (void) removeView:(UIView *)view;
- (void) removeTipView;
@end