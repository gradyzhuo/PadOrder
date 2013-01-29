//
//  TableCellViewClass.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/18.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CGAffineTransform.h>
#import <QuartzCore/QuartzCore.h>
#import "VarsButton.h"
#import "FBConnect.h"
#import "padOrderAppDelegate.h"
#import "POMoreImageViewController.h"
#import "AllEntity.h"

@interface TableCellViewClass : UITableViewCell <UITableViewDelegate,FBLoginDialogDelegate,FBSessionDelegate,FBDialogDelegate,FBSessionDelegate>{
    padOrderAppDelegate *applicationDelegate;
    EntityDish *dishEntityInfo;
    UIImageView *dishImageView;
    UILabel *titleLabel;
    UITextView *descriptTextView;
    UIImage *dishImage;
    VarsButton *submitButton;
    VarsButton *detailButton;
    UILabel *priceLabel;
	UISlider *hotSplider;
    UILabel *shareLabel;
    UIImageView *crownImageView;
    UILabel *crownLabel;
    VarsButton *dishImageButton;
}
@property (nonatomic, retain) padOrderAppDelegate *applicationDelegate;
@property (nonatomic, retain) EntityDish *dishEntityInfo;
@property (nonatomic, retain) UILabel *shareLabel;
@property (nonatomic, retain) UIImage *dishImage;
@property (nonatomic, retain) UIImageView *dishImageView;
@property (nonatomic, retain) VarsButton *submitButton;
@property (nonatomic, retain) VarsButton *detailButton;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UITextView *descriptTextView;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UISlider *hotSplider;
@property (nonatomic, retain) UIImageView *crownImageView;
@property (nonatomic, retain) UILabel *crownLabel;
@property (nonatomic, retain) VarsButton *dishImageButton;
- (void) assignSetup;
- (void) setImage:(UIImage *)image inFrame:(CGRect)frame; 
//- (void) setButton:(UIButton *)button;
- (void) setDescription:(NSString *)description andFontSize:(CGFloat)fontSize withColor:(UIColor *)color;
- (void) setDishTitle:(NSString *)title andFontSize:(CGFloat)size;
- (void) setSubmitButton:(NSString *)normalImageName withShadow:(BOOL)canUseShowdow;
- (void) setDetailButton:(NSString *)normalImageName withShadow:(BOOL)canUseShowdow;

- (void) label:(UILabel *)label withPoint:(CGPoint)point setText:(NSString *)text andFontSize:(CGFloat)size andOffset:(CGSize)offset;
- (void) setDishPrice:(NSNumber *)price andFontSize:(CGFloat)size;
- (UIImage*)imageWithShadow : (UIImage *)image;
- (CGFloat) pointFromRightSide:(CGFloat) width;
- (CGFloat) pointFromButtomSide:(CGFloat) height;
- (IBAction) shareToSocial:(id)sender;
- (void) setCrownLabelText:(NSString *)text andFontSize:(CGFloat) size andOffset:(CGSize)offset;
- (void) moreDishImage:(id)sender;

@end
