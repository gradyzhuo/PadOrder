//
//  padOrderTabBarControllerDelegate.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "padOrderTabBarControllerDelegate.h"
#import "padOrderSplitControllerDelegate.h"
#import "MainFuncViewController.h"
#import "padOrderAlertViewDelegate.h"
#import "padOrderAppDelegate.h"
#import "DishDetailViewController.h"
#import "MemberViewController.h"

@implementation padOrderTabBarControllerDelegate
@synthesize splitControllerDelegate;
@synthesize mainViewController;
@synthesize splitPopoverButton;
@synthesize beforeNavController;
@synthesize blackView;
@synthesize blackViewController;
@synthesize actionSheet;

#pragma mark -
#pragma mark  AlertDelegate

-(void) willPresentAlertView:(UIAlertView *)alertView{
    //CGFloat originX = alertView.frame.origin.x;
    //CGFloat originY = alertView.frame.origin.y;
    //CGFloat originWidth = alertView.frame.size.width;
    //CGFloat originHeight = alertView.frame.size.height;
    
    //alertView.frame = CGRectMake(originX, originY, originWidth, originHeight+100);
    ////(@"%@",alertView.subviews);
    for (id item in alertView.subviews) {
        if([[[item class] description] isEqual:@"UIThreePartButton"]){
                ////(@"%@",item);
                //(UIThreePartButton)item.frame.origin.y += 10;
        }
    }
}

-(void) didPresentAlertView:(UIAlertView *)alertView{
}

#pragma mark -
#pragma mark  TabBarDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSInteger index = [[tabBarController viewControllers] indexOfObject:viewController];
    //tabBarController.selectedViewController = viewController;
    
    //[tabBarController tabBar:tabBarController.tabBar didSelectItem:[[[tabBarController tabBar] items] objectAtIndex:index]];

    UINavigationController *currentNavigationController = (UINavigationController *)viewController;
    UIViewController *currentViewController = [currentNavigationController visibleViewController];
    
    //[currentViewController viewDidUnload];
    //[currentNavigationController viewDidUnload];
    
    if(index == 0){
        UIView *buttonView = [[[beforeNavController visibleViewController] view] viewWithTag:9001];
        [buttonView removeFromSuperview];
        [[[[currentNavigationController visibleViewController] view] viewWithTag:9001] removeFromSuperview];
        //[buttonView release];
        
        [self.applicationDelegate backToIndexView:[NSNumber numberWithInt:[[tabBarController viewControllers] indexOfObject:beforeNavController]]];
    }
    
    else if(viewController == beforeNavController){

    }
    
    else if(index == 4 ){
        
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"請點選欲請求服務" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"鍋底加湯",@"清桌服務",@"疑難雜症",@"登出會員資料",nil];
        
        actionSheet.frame = CGRectMake(100, 100, 500, 500);
        [actionSheet addButtonWithTitle:@"Space"];
        //actionSheet.userInteractionEnabled = NO;
        
        ////(@"%d",actionSheet.userInteractionEnabled);
        
        self.blackViewController = [[UIViewController alloc] init];
        self.blackViewController.view.frame = [[UIScreen mainScreen] bounds];
        self.blackViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];

        //self.blackView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        //[[(padOrderAppDelegate *)[[UIApplication sharedApplication] delegate] window] addSubview:blackView];
        [[(padOrderAppDelegate *)[[UIApplication sharedApplication] delegate] window] addSubview:blackViewController.view];
        
        [actionSheet showInView:blackViewController.view];
        
        
        //[HH showFromRect:CGRectMake(0, 0, 400, 500) inView:viewController.view animated:YES];
        
         
        
        //if (beforeNavController.view.tag == 0) {
        //    viewController = [[tabBarController viewControllers] objectAtIndex:1];
        //}
        /*
        UIAlertView *serviceAlertView = [[UIAlertView alloc] initWithTitle:@"請點選欲請求服務" message:@"別忘了謝謝辛苦的服務人員喔！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"鍋底加湯",@"清桌服務",@"疑難雜症",nil];
            //[serviceAlertView setAccessibilityFrame:CGRectMake(100, 500, 500, 300)];
            //[serviceAlertView setBounds:CGRectMake(0, 0, 500, 500)];
        [serviceAlertView show];
         */
        tabBarController.selectedViewController = beforeNavController;
    }
    else{
        if (index == 5) {
            MemberViewController *memberViewController = (MemberViewController *)currentViewController;
            if ([self.applicationDelegate.standardUserDefaults boolForKey:@"MEMBER_LOGIN"]) {
                [memberViewController loginSuccessAction:nil];
            }
            else{
                if(memberViewController.isLoginState){ 
                    [memberViewController logout:nil];
                }
            }
        }
        [viewController viewDidLoad];
        //[[beforeNavController visibleViewController] viewDidUnload];
        //[currentViewController viewDidLoad];
        //[currentViewController viewDidAppear:YES];
        
        //UINavigationController *currentNavigationViewController = tabBarController.selectedViewController;
        
        
        self.splitPopoverButton = (UINavigationItem *)beforeNavController.topViewController.navigationItem.leftBarButtonItem;
        
        
        
        //if (viewController.interfaceOrientation == UIInterfaceOrientationPortrait || UIInterfaceOrientationPortraitUpsideDown) {
            
            //currentViewController.navigationItem.leftBarButtonItem = splitPopoverButton;
            //beforeNavController.topViewController.navigationItem.leftBarButtonItem = nil;
            //[viewController loadView];
        UIView *buttonView = [[[beforeNavController visibleViewController] view] viewWithTag:9001];
            //[buttonView removeFromSuperview];
        //[currentViewController loadView];
        //if (![currentViewController.view viewWithTag:9001]) {
            [currentViewController.view addSubview:buttonView];
        //}
        
            
        //}
        
        beforeNavController = (UINavigationController *)viewController;
        UINavigationController *navigation = (UINavigationController *)viewController;
        
        if([[[[navigation visibleViewController] class] description] isEqualToString:@"DishDetailViewController"]){
            DishDetailViewController *detailViewController = (DishDetailViewController *)navigation.visibleViewController;
            [detailViewController resetContentScrollFrameWithOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
        }
        
        
    }
    //[currentViewController viewDidLoad];
    //[currentNavigationController viewDidLoad];
    //[viewController viewDidLoad];
}

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
 //   NSLog(@"%d",buttonIndex);
//}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet{
    
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet{
    UILabel *titleLabel = nil;
    //NSInteger buttonCounter = 0;
    for (UIView *object in actionSheet.subviews) {
        if ([[[object class] description] isEqualToString:@"UILabel"]) {
            titleLabel = (UILabel *)object;
        }
        else{
            CGPoint objOrigin = object.frame.origin;
            CGSize  objSize = object.frame.size;
            CGFloat objHeight = objSize.height;
            object.frame = CGRectMake(objOrigin.x, objOrigin.y+objHeight, objSize.width, objSize.height);
            //buttonCounter++;
        }
    }
    
    ////(@"%@,max:%d",actionSheet.subviews,buttonCounter);
    
    NSInteger buttonMaxTag = [actionSheet numberOfButtons];
    [[actionSheet viewWithTag:buttonMaxTag] removeFromSuperview];
    
    CGFloat fontSize = 25;
    CGRect titleFrame = titleLabel.frame;
    CGPoint titleOrigin = titleFrame.origin;
    CGSize  titleSize = titleFrame.size;
    
    titleLabel.frame = CGRectMake(titleOrigin.x, titleOrigin.y+10, titleSize.width, fontSize);
    
    titleLabel.text = [NSString stringWithFormat:@"%@",titleLabel.text,titleLabel.text];
    titleLabel.font = [UIFont fontWithName:titleLabel.font.fontName size:fontSize];
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleOrigin.x, titleOrigin.y+40, titleSize.width, titleSize.height)];
    
    subTitleLabel.textColor = titleLabel.textColor;
    subTitleLabel.shadowColor = titleLabel.shadowColor;
    subTitleLabel.shadowOffset = titleLabel.shadowOffset;
    subTitleLabel.font = [UIFont fontWithName:subTitleLabel.font.fontName size:16];
    subTitleLabel.text = @"別忘了謝謝辛苦的服務人員喔！";
    subTitleLabel.backgroundColor = [UIColor clearColor];
    subTitleLabel.textAlignment = UITextAlignmentCenter;
    [actionSheet addSubview:subTitleLabel];
    [subTitleLabel release]; 
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet{
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 4) {
        [self.applicationDelegate.fb logout:self];
        [self.applicationDelegate.standardUserDefaults setObject:@"訪客" forKey:@"MEMBER_NAME"];
        
        [self.applicationDelegate backToIndexView:[NSNumber numberWithInt:1]];
    }

    [UIView beginAnimations:@"RemoveBlackBackGroundView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    //blackView.alpha = 0;
    blackViewController.view.alpha = 0;
    //[blackView removeFromSuperview];
    [UIView commitAnimations];
    [blackViewController.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5];
    //[blackView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5];
}

- (void) configureTabBarItemWithTabBarController:(UITabBarController *)tabBarController{
    NSInteger index = 0;
    
    for (UITabBarItem *item in tabBarController.tabBar.items) {
        UINavigationController *aViewController = [tabBarController.viewControllers objectAtIndex:index];
        //[aViewController loadView];
        //[aViewController viewDidAppear:YES];
        //[aViewController viewDidLoad];
        item.image = [UIImage imageNamed:[NSString stringWithFormat:@"Symbol_%d.png",index]];
        index ++;
    }
}

@end
