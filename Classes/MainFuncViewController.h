//
//  MainFuncViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "POViewController.h"
@class MenuViewController;
@class NewsViewController;
@class MemberViewController;
@class padOrderTabBarControllerDelegate;
@class DishForRankViewController;
@class DishForOrderViewController;
@class SuggestViewController;
@class RankingViewController;

@interface MainFuncViewController : UIViewController<UITabBarDelegate,UITabBarControllerDelegate,UINavigationControllerDelegate,UINavigationBarDelegate> {
    UITabBarController *funcsTabBarController;
    
    NewsViewController *newsViewController;
    MenuViewController *dishViewController;
    //DishViewController *rankViewController;
    RankingViewController *rankingViewController;
    MemberViewController *memberViewController;
    SuggestViewController *suggestViewController;
    
    
    
    NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) IBOutlet UITabBarController *funcsTabBarController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (NSArray *) createTabBarArray;
- (void) configureTabBarItem;
- (UINavigationController *) convertViewController:(UIViewController *) rootController WithTitle:(NSString *)viewTitle;
- (UINavigationController *) convertViewController:(UIViewController *) rootController  delegate:(id) delegate  WithTitle:(NSString *)viewTitle;
- (void) folderSocialBar:(id)sender;

@end
