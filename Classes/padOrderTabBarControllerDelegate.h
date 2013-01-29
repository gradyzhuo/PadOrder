//
//  padOrderTabBarControllerDelegate.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "padOrderAppDelegate.h"
//#import <Foundation/Foundation.h>
#import "POObject.h"

@class padOrderSplitControllerDelegate;
@class MainFuncViewController;

@interface padOrderTabBarControllerDelegate : POObject <UITabBarControllerDelegate,UIAlertViewDelegate,UIActionSheetDelegate,FBSessionDelegate>{
    padOrderSplitControllerDelegate *splitControllerDelegate;
    MainFuncViewController *mainViewController;
    UINavigationItem *splitPopoverButton;
    UINavigationController *beforeNavController;
    UIView *blackView;
    UIViewController *blackViewController;
    UIActionSheet *actionSheet;
}

@property (nonatomic, assign) padOrderSplitControllerDelegate *splitControllerDelegate;
@property (nonatomic, assign) IBOutlet MainFuncViewController *mainViewController;
@property (nonatomic, retain) UINavigationItem *splitPopoverButton;
@property (nonatomic, retain) UINavigationController *beforeNavController;
@property (nonatomic, retain) UIView *blackView;
@property (nonatomic, retain) UIViewController *blackViewController;
@property (nonatomic, retain) UIActionSheet *actionSheet;

- (void) configureTabBarItemWithTabBarController:(UITabBarController *)tabBarController;

@end
