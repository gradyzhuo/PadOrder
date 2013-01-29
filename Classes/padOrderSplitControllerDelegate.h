//
//  padOrderSplitControllerDelegate.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "POObject.h"

@class MainFuncViewController;
@class padOrderPopoverDelegate;
@interface padOrderSplitControllerDelegate : POObject <UISplitViewControllerDelegate,UIPopoverControllerDelegate>{
    UINavigationController *selectedNavController;
    UITabBarController *tabBarController;
    UIPopoverController *popOverController;
}

@property (nonatomic, retain) UIPopoverController *popOverController;
@property (nonatomic, retain) UITabBarController *tabBarController;

- (void) popoverViewController:(id)sender;

@end
