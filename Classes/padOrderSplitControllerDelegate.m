//
//  padOrderSplitControllerDelegate.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "padOrderSplitControllerDelegate.h"
#import "MainFuncViewController.h"
#import "padOrderPopoverDelegate.h"
#import "OrderedListViewController.h"
#import "SRViewController.h"

@implementation padOrderSplitControllerDelegate
@synthesize popOverController;
@synthesize tabBarController;

- (void) splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    
    //OrderedListViewController *orderedListViewController = (OrderedListViewController *)aViewController;
    
    self.tabBarController = [svc.viewControllers objectAtIndex:1];
    selectedNavController = (UINavigationController *)self.tabBarController.selectedViewController;
    
    SRViewController *selectedViewController = (SRViewController *)[selectedNavController visibleViewController];
    //srViewController.pageTitleLabel.font = [UIFont fontWithName:srViewController.pageTitleLabel.font.fontName size:50];
    
    [selectedViewController setPageTitleLabelFontSizeWithInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    UIView *buttonView = [selectedNavController.topViewController.view viewWithTag:9001];
    [buttonView removeFromSuperview];
    
    //[[selectedNavController.topViewController.view viewWithTag:9001] removeFromSuperview];
    //[buttonView release];
    
    //selectedNavController.topViewController.navigationItem.leftBarButtonItem = nil;
    //selectedNavController.navigationBarHidden = YES;
    
    if (self.popOverController.popoverVisible) {
        //NSLog(@"還在顯示");
        [self.popOverController dismissPopoverAnimated:YES];
    }
    
    self.applicationDelegate.splitPopoverController = nil;
    self.popOverController = nil;
    self.popOverController.contentViewController = nil;
    //orderedListViewController.popoverController = nil;
    //[bViewController release];
    
}

- (void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    
    //OrderedListViewController *orderedListViewController = (OrderedListViewController *)aViewController;
    
    self.tabBarController = [svc.viewControllers objectAtIndex:1];
    selectedNavController = (UINavigationController *)self.tabBarController.selectedViewController;
    
    //[selectedNavController.view addSubview:barButtonItem];
    SRViewController *selectedViewController = (SRViewController *)selectedNavController.topViewController;
    
    //[selectedViewController setPageTitleLabelFontSizeWithInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    if (![selectedViewController.view viewWithTag:9001]) {
        UIButton *orderedListButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orderedListButton.tag = 9001;
        UIImage *orderedListButtonButtonNormalImage = [UIImage imageNamed:@"OrderedListButton.png"];
        UIImage *orderedListButtonButtonSelectedImage = [UIImage imageNamed:@"OrderedListButtonSelected.png"];
        [orderedListButton setBackgroundImage:orderedListButtonButtonNormalImage forState:UIControlStateNormal];
        [orderedListButton setBackgroundImage:orderedListButtonButtonSelectedImage forState:UIControlStateSelected];
        
        orderedListButton.frame = CGRectMake(40, 15, 262, 51);
        //orderedListButton.transform = CGAffineTransformMakeRotation(-0.05);
        orderedListButton.titleLabel.font = [UIFont fontWithName:orderedListButton.titleLabel.font.fontName size:25];
        //orderedListButton.tag = 8101;
        orderedListButton.showsTouchWhenHighlighted = YES;
        [orderedListButton addTarget:self action:@selector(popoverViewController:) forControlEvents:UIControlEventTouchUpInside];
        
        [selectedViewController.view addSubview:orderedListButton];
    }
    
    //if([selectedNavController.viewControllers count]>1) 
    //    selectedViewController =[selectedNavController.viewControllers objectAtIndex:1];
    
    //if(selectedViewController.navigationItem.backBarButtonItem){
    //    selectedViewController.navigationItem.rightBarButtonItem = barButtonItem;
    //}
    //else{
     //   selectedViewController.navigationItem.leftBarButtonItem = barButtonItem;
    //}
    //orderedListViewController.popoverController = pc;
    self.applicationDelegate.splitPopoverController = pc;
    self.popOverController = pc;
    pc.delegate = self;
}

- (void) popoverViewController:(id)sender{
    //UIView *orderedListButtonView = [[selectedNavController.visibleViewController view] viewWithTag:9001];
    [self.popOverController presentPopoverFromRect:CGRectMake(40, 50, 262, 51) inView: self.tabBarController.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

/*
- (void) splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController{
    
    //為了避免原來的ViewController出現問題
    //直接init一個新的listViewController

    OrderedListViewController *rootViewController = [[OrderedListViewController alloc] init];
    
    UINavigationController *showNaviController = [[UINavigationController alloc] initWithRootViewController:rootViewController];

    [pc setContentViewController:showNaviController];
     
    
}
*/
/*
-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    [popOverController.contentViewController.view removeFromSuperview];
}

*/

@end
