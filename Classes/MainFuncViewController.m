    //
//  MainFuncViewController.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainFuncViewController.h"
#import "NewsViewController.h"
#import "MenuViewController.h"
#import "MemberViewController.h"
#import "RankingViewController.h"
#import "padOrderTabBarControllerDelegate.h"
#import "padOrderSplitControllerDelegate.h"
#import "SuggestViewController.h"

@implementation MainFuncViewController
@synthesize funcsTabBarController;
@synthesize managedObjectContext;


#pragma mark -
#pragma mark 自定方法

- (void) folderSocialBar:(id)sender{
    
    //[UIView beginAnimations:@"FolderAnimation" context:nil];
    UINavigationBar *navigationBar = [self.funcsTabBarController.view viewWithTag:3001];
    navigationBar.hidden = !navigationBar.hidden;
}

- (NSArray *) createTabBarArray{
    
    //
    //實體化所有的ViewController
    newsViewController = [[NewsViewController alloc] initWithNibName:@"NewsView" bundle:[NSBundle mainBundle]];
    dishViewController = [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:[NSBundle mainBundle]];
    //rankViewController = [[DishForRankViewController alloc] initWithNibName:@"DishView" bundle:[NSBundle mainBundle]];
    rankingViewController = [[RankingViewController alloc] initWithNibName:@"RankingView" bundle:[NSBundle mainBundle]];
    memberViewController = [[MemberViewController alloc] initWithNibName:@"MemberView" bundle:[NSBundle mainBundle]];
    suggestViewController = [[SuggestViewController alloc] initWithNibName:@"SuggestView" bundle:[NSBundle mainBundle]];
    
    [newsViewController retain];
    [dishViewController retain];
    [rankingViewController retain];
    [memberViewController retain];
    [suggestViewController retain];
    
    
    
    //
    //設定所有的ViewController成為NavigationController
    
    UINavigationController *starterView = [self convertViewController: [[UIViewController alloc] init] delegate:nil WithTitle:@"回首頁"];
    
    UINavigationController *dishNavController = [self convertViewController:dishViewController delegate:self WithTitle:@"完整菜單"];
    
    UINavigationController *suggestNavController = [self convertViewController:suggestViewController delegate:self WithTitle:@"主廚推薦"];
    
    //suggestNavController.navigationBarHidden = YES;
    
    UINavigationController *rankNavController = [self convertViewController:rankingViewController delegate:self WithTitle:@"人氣排行"];
    
    UINavigationController *callService = [self convertViewController: [[UIViewController alloc] init] delegate:nil WithTitle:@"使用服務鈴"];
    
    UINavigationController *memberNavController = [self convertViewController:memberViewController delegate:self WithTitle:@"會員專區"];
    
    starterView.view.tag = 0;
    suggestNavController.view.tag = 1;
    dishNavController.view.tag = 2;
    rankNavController.view.tag = 3;
    callService.view.tag = 4;
    memberNavController.view.tag = 5;
    
    NSArray *resultArray = [NSArray arrayWithObjects:
                            starterView,
                            suggestNavController,
                            dishNavController,  
                            rankNavController,                                                                                    
                            callService, 
                            memberNavController,
                            nil];
    
    return resultArray;
}

- (void) configureTabBarItem{
    NSInteger index = 0;
    
    for (UITabBarItem *item in self.funcsTabBarController.tabBar.items) {
        UINavigationController *aViewController = [self.funcsTabBarController.viewControllers objectAtIndex:index];
        
        item.image = [UIImage imageNamed:[NSString stringWithFormat:@"Symbol_%d.png",aViewController.view.tag]];
        index ++;
    }
}

- (UINavigationController *) convertViewController:(UIViewController *)rootController WithTitle:(NSString *)viewTitle{
    rootController.title = viewTitle;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootController];
    navController.delegate = self;
    navController.navigationBar.tintColor = [UIColor grayColor];
    return [navController autorelease];
}


- (UINavigationController *)convertViewController:(UIViewController *)rootController delegate:(id)delegate WithTitle:(NSString *)viewTitle{
    
    UINavigationController *navigationController = [self convertViewController:rootController WithTitle:viewTitle];
    navigationController.delegate = delegate;
    return navigationController;
}

#pragma mark -
#pragma mark UINavigationController Delegate

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIDevice *currentDevice = [UIDevice currentDevice];
    BOOL isSingleLevel = ([navigationController.viewControllers count] == 1);
    
    UIDeviceOrientation orientation = [currentDevice orientation];
    if (orientation == UIDeviceOrientationUnknown) {
        orientation = UIDeviceOrientationLandscapeLeft;
    }
    BOOL isLandscape = (orientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationLandscapeRight);
    
    
    if (isSingleLevel ) {
        
        if (isLandscape) {
            viewController.navigationItem.leftBarButtonItem = nil;
        }
        else{
            viewController.navigationItem.rightBarButtonItem = viewController.navigationItem.leftBarButtonItem;
            viewController.navigationItem.leftBarButtonItem = nil;
        }
    }
    
}


- (void) navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
}

#pragma mark -
#pragma mark UINavigationBar Delegate

- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item{
    //(@"pop");
}

- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item{
    //(@"push");
}

#pragma mark -
#pragma mark UIViewController 

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
   [super viewDidLoad];
    self.funcsTabBarController = [[UITabBarController alloc] init];
    //self.funcsTabBarController = [[UITabBarController alloc] initWithNibName:@"MainFuncView" bundle:[NSBundle mainBundle]];
    self.funcsTabBarController.viewControllers = [self createTabBarArray];
    
    //這裡要設定第一個要被顯示的初始畫面
    UINavigationController *setupFirstNavController = [self.funcsTabBarController.viewControllers objectAtIndex:1];
    
    //self.funcsTabBarController.selectedViewController = setupFirstNavController;
    
     //指定tabBarController的委派物件
    padOrderTabBarControllerDelegate *tabBarDelegate = [[padOrderTabBarControllerDelegate alloc] init];
    tabBarDelegate.mainViewController = self;//指定過去
    tabBarDelegate.beforeNavController = setupFirstNavController;
    tabBarDelegate.splitControllerDelegate = (padOrderSplitControllerDelegate *)self.splitViewController.delegate;
//    tabBarDelegate.splitPopoverButton = (UINavigationItem *)setupFirstNavController.topViewController.navigationItem.leftBarButtonItem;
    
    //透過Delegate才可以讓後續的AlertVew設定不會出現問題
    [tabBarDelegate tabBarController:funcsTabBarController didSelectViewController:setupFirstNavController];
    
    self.funcsTabBarController.delegate = tabBarDelegate;
    
    
    
    /*
    CGFloat x = 0;
    CGFloat y = 620;
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(x, y, self.funcsTabBarController.tabBar.frame.size.width, 80)];
    navigationBar.translucent = YES;
    navigationBar.tintColor = [UIColor colorWithWhite:0.3 alpha:0];
    navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    navigationBar.tag = 3001;
    
    UIButton *folderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [folderButton addTarget:self action:@selector(folderSocialBar:) forControlEvents:UIControlEventTouchUpInside];
    folderButton.frame = CGRectMake(0,600,20,20);
    //UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0,600,20,20)];
    //view.backgroundColor = [UIColor redColor];
    
    
    [self.funcsTabBarController.view addSubview:navigationBar];
    [self.funcsTabBarController.view addSubview:folderButton];
    */

    //self.funcsTabBarController.tabBar.backgroundColor = [UIColor redColor];
    
    
    //UIColor *kMainColor = [UIColor colorWithRed:0.41 green:0.68 blue:0.74 alpha:0.7];
    //UIColor *kMainColor = [UIColor colorWithHue:191 saturation:0.44 brightness:0.74 alpha:1];
    /*UIImage *image = [UIImage imageNamed:@"tabbar.png"];

    UIColor *kMainColor = [UIColor colorWithPatternImage:image];
    CGRect frame = CGRectMake(0.0, 0.0, 768, 49);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    [v setBackgroundColor:kMainColor];
    
    [self.funcsTabBarController.tabBar addSubview:v];
    [v release];
    */
    
    //UILabel *label = [[[self.funcsTabBarController.tabBar.subviews objectAtIndex:0] subviews] lastObject];
    //label.textColor = [UIColor whiteColor];
    //label.font = [UIFont fontWithName:label.font.fontName size:30];
    //NSLog(@"tabbar.sub:%@",[[self.funcsTabBarController.tabBar.subviews objectAtIndex:0] subviews]);
    
    [self configureTabBarItem];
    [self setView: self.funcsTabBarController.view];
    //[self.view addSubview:self.funcsTabBarController.view];
    //[setupFirstNavController release];
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //@synthesize funcsTabBarController;
    //@synthesize managedObjectContext;
    self.funcsTabBarController = nil;
    //NSLog(@"????");

}

- (void)dealloc {
    [super dealloc];
}


@end
