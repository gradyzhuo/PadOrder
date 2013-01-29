//
//  padOrderAppDelegate.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/1.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "GuideViewsController.h"
#import "MainFuncViewController.h"

#define FB_PADORDER_ID @"172228222789173"

@class BeginViewController;
@class GStepControllerCollection;
@class padOrderSplitControllerDelegate;
@class padOrderTabBarControllerDelegate;
@class EntityDish;
@class EntityDishKind;
@class RestaurantIntroViewController;
//@class padOrderFacebookDelegate;

@interface padOrderAppDelegate : NSObject <UIApplicationDelegate,UIAlertViewDelegate,FBSessionDelegate> {
    UIWindow *window;
    UITabBarController *bottomTabBarController;
     UISplitViewController *mainSplitViewController;
    UIPopoverController *splitPopoverController;
    BeginViewController *beginViewController;
    //padOrderFacebookDelegate *facebookDelegate;
    padOrderTabBarControllerDelegate *tabBarControllerDelegate;
    UINavigationController *BGNavigationController;
    GStepControllerCollection *guideStepObject;
    RestaurantIntroViewController *restaurantIntroViewController;
    Facebook *fb;
    NSString *fb_PadOrder_id;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}


@property (nonatomic, retain) UIPopoverController *splitPopoverController;
@property (nonatomic, retain) padOrderTabBarControllerDelegate *tabBarControllerDelegate;
@property (nonatomic, retain) IBOutlet UITabBarController *bottomTabBarController;
@property (nonatomic ,retain) IBOutlet UISplitViewController *mainSplitViewController;
@property (nonatomic, retain) UINavigationController *BGNavigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) BeginViewController *beginViewController;
@property (nonatomic, retain) Facebook *fb;
@property (nonatomic, retain) NSUserDefaults *standardUserDefaults;
@property (nonatomic, readonly)  NSString *fb_PadOrder_id;
@property (nonatomic, retain) GStepControllerCollection *guideStepObject;
@property (nonatomic, retain) RestaurantIntroViewController *restaurantIntroViewController;

//@property (nonatomic, retain) padOrderFacebookDelegate *facebookDelegate;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void) windowPageTransitionAnimation:(NSInteger)type;
- (IBAction) actionToNext:(id)sender;
- (NSURL *)applicationDocumentsDirectory;
- (void) insertTempData;
- (void) setDishKind;
- (EntityDishKind *)selectKindObjectWithSegmentType:(NSInteger)typeNo andSegmentNo:(NSInteger)segmentNo;
- (IBAction) backToIndexView:(id)sender;
- (NSString *) numberToChinese:(NSInteger)number;
- (NSString *) convertNumberToChinese:(NSInteger) number;
- (void) sliderView:(UIView *)aView from:(CGRect)from to:(CGRect)to;
- (void) sliderView:(UIView *)aView beShow:(BOOL)show;
- (void) setupUserDefaults;
- (void) insertDishData;

@end

