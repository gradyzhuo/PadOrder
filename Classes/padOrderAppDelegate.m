//
//  padOrderAppDelegate.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/1.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "padOrderAppDelegate.h"
#import "MainFuncViewController.h"
#import "BeginViewController.h"
#import "padOrderSplitControllerDelegate.h"
#import "OrderedInfoModelController.h"
#import "EntityDish.h"
#import "EntityDishSet.h"
#import "EntityDescribe.h"
#import "EntityDishKind.h"
#import "EntityImage.h"
#import "EntityStatus.h"
#import "DishKindModelController.h"
#import "GStepControllerCollection.h"
#import "PORequestFromWebConnectionDeleagte.h"
#import <QuartzCore/QuartzCore.h>
#import "EntityMember.h"
#import "RestaurantIntroViewController.h"
#import "EntitySave.h"
#import "EntityMemberSave.h"
#import "padOrderTabBarControllerDelegate.h"
#import "EntitiesDataManagerController.h"

#define DISH_NAME @"東洋香檸雞腿飯"
//#define DISH_NAME @"特製北京烤鴨"
//#define DISH_NAME @"特製烤雞"
//#define DISH_NAME @"123"
#define SET_NAME @"異國主廚"

#define DISH_IMG_PATH @"DishImages"


@implementation padOrderAppDelegate
@synthesize window;
@synthesize mainSplitViewController;
@synthesize beginViewController;
@synthesize BGNavigationController;
@synthesize guideStepObject;
@synthesize fb;
@synthesize fb_PadOrder_id;
@synthesize standardUserDefaults;
@synthesize restaurantIntroViewController;
@synthesize bottomTabBarController;
@synthesize tabBarControllerDelegate;
@synthesize splitPopoverController;

- (void) setDishKind{
}

- (void) sliderView:(UIView *)aView from:(CGRect)from to:(CGRect)to{
    
    //[self.mainSplitViewController.view addSubview:blackView];
    
    [self.mainSplitViewController.view addSubview:aView];
    aView.frame = from;
    aView.alpha = (aView.tag % 100);
    
    
    if (aView.tag == 101) {
        aView.tag = 0;
    }else{
        aView.tag = 1;
    }
    
    [UIView beginAnimations:@"SliderViewAnimation" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    aView.alpha = aView.tag;
    aView.frame = to;
    aView.tag = 9;
    [UIView commitAnimations];
    
}

- (void) sliderView:(UIView *)aView beShow:(BOOL)show{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGFloat height; 
    CGFloat width; 
    
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortraitUpsideDown:
        case UIInterfaceOrientationPortrait:
            height = screenBound.size.height;
            width = screenBound.size.width;
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            width = screenBound.size.height;
            height = screenBound.size.width;
            break;
    }
    
    CGRect hiddenFrame = CGRectMake(0, height, width, height);
    CGRect showFrame = CGRectMake(0, 0, width, height);
    if (show) {
        aView.tag = 100;
        [self sliderView:aView from:hiddenFrame to:showFrame];
        
    }
    else{
        aView.tag = 101;
        [self sliderView:aView from:showFrame to:hiddenFrame];
        
    }
}


- (NSString *)numberToChinese:(NSInteger)number{
    
    NSString *string = nil;
    
    switch (number) {
        case 0:
            string = @"零";
            break;
        case 1:
            string = @"一";
            break;
        case 2:
            string = @"二";
            break;
        case 3:
            string = @"三";
            break;
        case 4:
            string = @"四";
            break;
        case 5:
            string = @"五";
            break;
        case 6:
            string = @"六";
            break;
        case 7:
            string = @"七";
            break;
        case 8:
            string = @"八";
            break;
        case 9:
            string = @"九";
            break;
        case 10:
            string = @"十";
            break;
        case 100:
            string = @"百";
            break;
        case 1000:
            string = @"千";
            break;
        case 10000:
            string = @"萬";
            break;
    }
    
    return string;
}

- (NSString *)convertNumberToChinese:(NSInteger)number{
    NSInteger checkNum = number;
    NSInteger placeNum = 1;
    NSInteger tailNum = 0;
    NSString *string = [NSString string];
    NSString *chPlaceNumString = @"";
    while ((tailNum =  (number % 10))) {
        NSString *chNumString = [self numberToChinese:tailNum];
        if (placeNum != 1) chPlaceNumString = [self numberToChinese:placeNum];
        
        string = [NSString stringWithFormat:@"%@%@%@",chNumString,chPlaceNumString,string];
        
        NSLog(@"%@,%d,%d",string,tailNum,placeNum);
        
        number = number / 10;
        placeNum *= 10;
    }
}


- (EntityDishKind *) selectKindObjectWithSegmentType:(NSInteger)typeNo andSegmentNo:(NSInteger)segmentNo{
    EntityDishKind *kind = nil;
    DishKindModelController *kindModelController = [[DishKindModelController alloc]init];
    kind = [[kindModelController entity:@"Dish_Kind" withPredicate:[NSString stringWithFormat:@"Kind_No=%d",segmentNo]sortBy:@"Kind_No" ascending:YES] objectAtIndex:typeNo];
    return kind;
}

- (void) insertTempData{
    //2010/10/25註記
    //現在要把插入資料的動作簡化
    //也可以做成Method放進ModelController中
    //
    //OrderedDishModelController *orderedDishModelController =  [[OrderedDishModelController alloc] init];
    
    ////(@"managedObjectContext:%@",self.managedObjectContext);
    
    //以下為優惠券資料
    
    NSEntityDescription *saveEntity = [NSEntityDescription entityForName:@"Save" inManagedObjectContext:self.managedObjectContext];
    
    EntitySave *save = nil;
    
    save = [[EntitySave alloc] initWithEntity:saveEntity insertIntoManagedObjectContext:self.managedObjectContext];
    save.Save_No = [NSNumber numberWithInt:000003];
    save.Save_Type = @"ES";
    save.Save_Name = @"全面打9折";
    save.Save_Degree = [NSNumber numberWithInt:0.9];
    
    [self.managedObjectContext save:nil];
    
    //以下是會員資料
    NSEntityDescription *memberEntity = [NSEntityDescription entityForName:@"Members" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *memberFetch = [[NSFetchRequest alloc] init];
    //EntityDishKind *kind = nil;
    EntityMember *member = nil;

    [memberFetch setEntity:memberEntity];
    
    if([[self.managedObjectContext executeFetchRequest:memberFetch error:nil] count] == 0){
        member = [[EntityMember alloc] initWithEntity:memberEntity insertIntoManagedObjectContext:self.managedObjectContext];
        member.Member_ID = @"L124156625";
        member.Member_Name = @"卓廷叡";
        member.Password = @"12345678";
        member.Member_Phone = @"0911760224";
        [self.managedObjectContext save:nil];
        
        NSEntityDescription *member_saveEntity = [NSEntityDescription entityForName:@"Member_Save" inManagedObjectContext:self.managedObjectContext];
        EntityMemberSave *member_save = [[EntityMemberSave alloc] initWithEntity:member_saveEntity insertIntoManagedObjectContext:self.managedObjectContext];
        
        member_save.Member = member;
        member_save.Save = save;
        [self.managedObjectContext save:nil];
    }
    
    //EntitiesDataManagerController *entitiesDataManager = [[EntitiesDataManagerController alloc] init];
    
    
    
    
    
    //底下是餐點類型
    NSEntityDescription *kindEntity = [NSEntityDescription entityForName:@"Dish_Kind" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *kindFetch = [[NSFetchRequest alloc] init];
    EntityDishKind *kind = nil;
    [kindFetch setEntity:kindEntity];
    NSError *ttt = nil;
    
    if([[self.managedObjectContext executeFetchRequest:kindFetch error:&ttt] count] == 0){
        ////(@"start:%@",[self.managedObjectContext executeFetchRequest:kindFetch error:nil]);
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:0];
        kind.Segment_Type = [NSNumber numberWithInt:1]; // 1代表是主要的點餐界面
        kind.Kind_Name = @"主廚特餐";
        [self.managedObjectContext save:nil];
        
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:1];
        kind.Segment_Type = [NSNumber numberWithInt:1]; // 1代表是主要的點餐界面
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"主菜單點";
        [self.managedObjectContext save:nil];
        
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:2];
        kind.Segment_Type = [NSNumber numberWithInt:1]; // 1代表是主要的點餐界面
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"特色小吃";
        [self.managedObjectContext save:nil];
        
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:3];
        kind.Segment_Type = [NSNumber numberWithInt:1]; // 1代表是主要的點餐界面
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"飲品甜點";
        [self.managedObjectContext save:nil];
        
        /**********************************************************************/
        
        /*kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:0];
        kind.Segment_Type = [NSNumber numberWithInt:2]; // 2代表是人氣排行
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"主廚推薦";
        [self.managedObjectContext save:nil];
        */
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:0];
        kind.Segment_Type = [NSNumber numberWithInt:2]; // 2代表是人氣排行
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"當月排行";
        [self.managedObjectContext save:nil];
        
        kind = [[EntityDishKind alloc] initWithEntity:kindEntity insertIntoManagedObjectContext:self.managedObjectContext];
        kind.Kind_No = [NSNumber numberWithInt:1];
        kind.Segment_Type = [NSNumber numberWithInt:2]; // 2代表是人氣排行
        kind.Will_Show = [NSNumber numberWithBool:YES];
        kind.Kind_Name = @"本週排行";
        [self.managedObjectContext save:nil];
    }
    
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dishes" inManagedObjectContext:self.managedObjectContext];
    
    NSEntityDescription *setEntity = [NSEntityDescription entityForName:@"Dishes_Set" inManagedObjectContext:self.managedObjectContext];

    NSEntityDescription *describeEntity = [NSEntityDescription entityForName:@"Dishes_Describe" inManagedObjectContext:self.managedObjectContext];
    
    NSEntityDescription *imageEntity = [NSEntityDescription entityForName:@"Dishes_Images" inManagedObjectContext:self.managedObjectContext];
    
    EntityDishSet *set = [[EntityDishSet alloc] initWithEntity:setEntity insertIntoManagedObjectContext:self.managedObjectContext];
    
    set.Set_Name = SET_NAME;
    set.Set_Note = @"濃濃的異國風情，是許多人嚮往的世界。異國主廚系列將帶領著您，品嚐各個不同角落的特色風味，讓您不用出遠門，也能環遊世界喔！\n經典代表：\n東洋香檸雞腿飯";
    
    EntityDescribe *describe = [[EntityDescribe alloc] initWithEntity:describeEntity insertIntoManagedObjectContext:self.managedObjectContext];
    
    describe.Describe_Complete = @"多汁鮮嫩的雞腿排先以多種香料醃製入味，散發著清新檸檬香氣，可以充分品嚐雞腿肉的鮮美滋味又不覺得油膩，是一道相當受歡迎的簡餐。";
    //describe.Describe_Complete = @"採用全鴨，讓你沒去過北京，也懂得北京風情！";
    //describe.Describe_Simple = @"採用全鴨，讓你沒去過北京，也懂得北京風情！";
    //describe.Describe_Simple = @"香濃帶勁的泡菜口感，如果您沒吃過，別說你吃過韓式泡菜！";
    //describe.Describe_Simple = @"特製的泰式酸辣醬，包你吃了意猶未盡！包含酥脆的面一口感，您吃過了嗎？";
    describe.Describe_Simple = @"多汁鮮嫩的雞腿排先以多種香料醃製入味，散發著清新檸檬香氣，可以充分品嚐雞腿肉的鮮美滋味又不覺得油膩，是一道相當受歡迎的簡餐。";
    //2010/10/29 現在要想辦法取出Kind物件，使用DishKindModelController
    
    //[self setDishKind];
    
    NSEntityDescription *statusEntity = [NSEntityDescription entityForName:@"Status" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *statusFetch = [[NSFetchRequest alloc] init];
    EntityStatus *status = nil;
    [statusFetch setEntity:statusEntity];
    
    if ([[self.managedObjectContext executeFetchRequest:statusFetch error:nil] count] ==0) {
        
        status = [[EntityStatus alloc] initWithEntity:statusEntity insertIntoManagedObjectContext:self.managedObjectContext];
        status.Status_No = [NSNumber numberWithInt:0];
        status.Status_Name = @"還在點餐的清單";
        [self.managedObjectContext save:nil];
        
        status = [[EntityStatus alloc] initWithEntity:statusEntity insertIntoManagedObjectContext:self.managedObjectContext];
        status.Status_No = [NSNumber numberWithInt:1];
        status.Status_Name = @"尚未買單的清單";
        [self.managedObjectContext save:nil];
        
        status = [[EntityStatus alloc] initWithEntity:statusEntity insertIntoManagedObjectContext:self.managedObjectContext];
        status.Status_No = [NSNumber numberWithInt:2];
        status.Status_Name = @"烹煮中";
        [self.managedObjectContext save:nil];
    }
    
    /************************************************************************************
    
    NSInteger timeNo = (int)[[NSDate date] timeIntervalSince1970];
    NSInteger type = 0;
    NSInteger div = 4;
    NSInteger no = timeNo%div;
    
    kind = [self selectKindObjectWithSegmentType:type andSegmentNo:no];
    
    EntityDish *dish = [[EntityDish alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    
    EntityImage *image = [[EntityImage alloc] initWithEntity:imageEntity insertIntoManagedObjectContext:self.managedObjectContext];
    image.Image_Path = DISH_IMG_PATH;
    image.Image_FileName = @"6.png";
    image.IsMainImage = [NSNumber numberWithBool:YES];
    image.Dish = dish;
    [self.managedObjectContext save:nil];
    
    image = [[EntityImage alloc] initWithEntity:imageEntity insertIntoManagedObjectContext:self.managedObjectContext];
    image.Image_Path = DISH_IMG_PATH;
    image.Image_FileName = @"1.png";
    image.IsMainImage = [NSNumber numberWithBool:NO];
    image.Dish = dish;
    [self.managedObjectContext save:nil];
    
    image = [[EntityImage alloc] initWithEntity:imageEntity insertIntoManagedObjectContext:self.managedObjectContext];
    image.Image_Path = DISH_IMG_PATH;
    image.Image_FileName = @"2.png";
    image.IsMainImage = [NSNumber numberWithBool:NO];
    image.Dish = dish;
    [self.managedObjectContext save:nil];
    
    //EntityImage *image = [[kindModelController entity:@"Dishes_Images" withPredicate:@"IsMainImage = YES" sortBy:@"IsMainImage" ascending:YES] objectAtIndex:0];
    //dish.Images = image;
    dish.Describe = describe;
    dish.DishSet = set;
    dish.Dish_No = [NSString stringWithFormat:@"%d",timeNo];//@"0";
    dish.Dish_Name = DISH_NAME;
    //[[[NSDate date] description] substringWithRange:NSMakeRange(0, 5)];//@"天廚奇譚";
    dish.Kind = kind;
    dish.Dish_Price = [NSNumber numberWithInt:256];
    dish.Update_Date = [NSDate date];
    dish.isSuggest = [NSNumber numberWithBool:YES];
    image.Dish = dish;
    dish.Type = [NSNumber numberWithInt:0];//0是一般餐點
    [self.managedObjectContext save:nil];
    
    
    /*
    dish = [[EntityDish alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    //dish.Describe = describe;
    //dish.DishSet = set;
    dish.Dish_No = @"E10002";//@"0";
    dish.Dish_Name = @"8折卡";
    //[[[NSDate date] description] substringWithRange:NSMakeRange(0, 5)];//@"天廚奇譚";
    dish.Dish_Price = [NSNumber numberWithFloat:0.9];
    dish.Update_Date = [NSDate date];
    dish.isSuggest = [NSNumber numberWithBool:YES];
    dish.Type = [NSNumber numberWithInt:9];//9是啪數優惠券
    [self.managedObjectContext save:nil];

    dish = [[EntityDish alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    //dish.Describe = describe;
    //dish.DishSet = set;
    dish.Dish_No = @"E20001";//@"0";
    dish.Dish_Name = @"折扣100元";
    //[[[NSDate date] description] substringWithRange:NSMakeRange(0, 5)];//@"天廚奇譚";
    dish.Dish_Price = [NSNumber numberWithFloat:50];
    dish.Update_Date = [NSDate date];
    dish.isSuggest = [NSNumber numberWithBool:YES];
    dish.Type = [NSNumber numberWithInt:8];//8是直接減的優惠券
    [self.managedObjectContext save:nil];
    
    //[self.managedObjectContext detectConflictsForObject:dish];
    
    // dish = [(EntityOrderedDish *)[test objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] Ordered_Dish];
    //[orderedDishModelController insertBeOrderedDish:dish];
    //[orderedInfoModelController insertBeOrderedDish:dish];
    //[padOrderDataManagerDelegate insertNewObjectWithDictionary:nil];
    */
}

- (void) setupUserDefaults{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PORestaurantInfo" ofType:@"plist"];
    NSDictionary *restaurtantDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.standardUserDefaults integerForKey:@"DESK_NO"] == 0) {
        [self.standardUserDefaults setInteger:1 forKey:@"DESK_NO"];
    }
    [self.standardUserDefaults setBool:NO forKey:@"MEMBER_LOGIN"];
    [self.standardUserDefaults setObject:@"" forKey:@"MEMBER_ID"];
    [self.standardUserDefaults setObject:@"" forKey:@"MEMBER_NAME"];
    [self.standardUserDefaults setObject:[restaurtantDict objectForKey:@"Restaurant_Name"] forKey:@"Restaurant_Name"];
    [self.standardUserDefaults setObject:[restaurtantDict objectForKey:@"Restaurant_No"] forKey:@"Restaurant_No"];
    
    [self.standardUserDefaults synchronize];
}

-(void)insertDishData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tempData" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    EntitiesDataManagerController *dataManagerController = [[EntitiesDataManagerController alloc] init];
    for (NSString *Dish_No in [dict allKeys]) {
        NSDictionary *Dish_Dict = [dict objectForKey:Dish_No];
        EntityDish *dish = [dataManagerController createDishEntityWithDict:Dish_Dict withDishNo:Dish_No];
        [self saveContext];
    }
    
    path = [[NSBundle mainBundle] pathForResource:@"rankingData" ofType:@"plist"];
    dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //NSLog(@"%@",dict);
    
    NSNumber *type = [NSNumber numberWithInteger:0];
    
    [dataManagerController createRankingEntityWithDict:[dict objectForKey:@"0"] withRankingType:type];
    
    type = [NSNumber numberWithInteger:1];
    [dataManagerController createRankingEntityWithDict:[dict objectForKey:@"1"] withRankingType:type];
    
    [self saveContext];
    
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self insertTempData];
    [self insertDishData];
    
    [self setupUserDefaults];
    //NSLog(@"%f",NSTimeIntervalSince1970);
    
    MainFuncViewController *test = [[MainFuncViewController alloc] init];
    //[self.bottomTabBarController viewDidLoad];
    self.bottomTabBarController.viewControllers = [test createTabBarArray];
    self.tabBarControllerDelegate = [[padOrderTabBarControllerDelegate alloc] init];
    self.bottomTabBarController.delegate = self.tabBarControllerDelegate;
    [self.tabBarControllerDelegate configureTabBarItemWithTabBarController:self.bottomTabBarController];
    
    fb_PadOrder_id = @"172228222789173";
    self.fb = [[Facebook alloc] initWithAppId:fb_PadOrder_id];
    self.fb.sessionDelegate = self;
    
    // Override point for customization after application launch.
    self.mainSplitViewController.delegate = [[padOrderSplitControllerDelegate alloc] init];
    self.mainSplitViewController.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    self.beginViewController = [[BeginViewController alloc] initWithNibName:@"BeginView" bundle:nil];
    
    self.restaurantIntroViewController = [[RestaurantIntroViewController alloc] initWithNibName:@"RestaurantIntroView" bundle:[NSBundle mainBundle]];
    self.BGNavigationController = [[UINavigationController alloc] initWithRootViewController:self.beginViewController];
    
    [self.mainSplitViewController viewDidLoad];
    BGNavigationController.view.tag = 1200;
    
    self.window.rootViewController = self.BGNavigationController;
    //[self.mainSplitViewController.view addSubview:BGNavigationController.view];
    
    self.guideStepObject = [[GStepControllerCollection alloc] init];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *dishImageDocumentPath = [[[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DishImages"] path];
    BOOL isExistImagePath = [filemanager fileExistsAtPath:dishImageDocumentPath];
    
    if(!isExistImagePath) [filemanager createDirectoryAtPath:dishImageDocumentPath attributes:nil];
     
    window.backgroundColor = [UIColor blackColor];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void) backToIndexView:(id)sender{
    NSArray *viewControllers = nil;
    UITabBarController *tabBarController = nil; 
    
    viewControllers = [self.mainSplitViewController viewControllers];
    tabBarController = [viewControllers lastObject];
    
    
    //for (UINavigationController *navigationController in tabBarController.viewControllers) {
        //[[navigationController visibleViewController] viewDidUnload];
        //[navigationController viewDidUnload];
    //}
    
    
    if ([[[sender class] description] isEqualToString:@"NSCFNumber"]) {
        NSNumber *indexNumber = (NSNumber *)sender;
        
        self.beginViewController.tabBarIndex = [indexNumber intValue];
    }
    self.window.rootViewController = self.BGNavigationController;
    [self windowPageTransitionAnimation:1];
    //[[UIApplication sharedApplication] setStatusBarOrientation:<#(UIInterfaceOrientation)#>]
}

- (IBAction) actionToNext:(id)sender{
    UIButton *touchButton = (UIButton *)sender;
    NSArray *viewControllers = nil;
    MainFuncViewController *mainFcuncViewController = nil;
    UITabBarController *tabBarController = nil; 
    UINavigationController *navigationController = nil;
    
    switch (touchButton.tag) {
        case 0:
            [((UINavigationController *)self.window.rootViewController) pushViewController:[self.guideStepObject nextViewController] animated:YES];
            break;
        case 1:
            //NSLog(@"???");

            viewControllers = [self.mainSplitViewController viewControllers];
            tabBarController = [viewControllers lastObject];
            
            //if (![mainFcuncViewController isViewLoaded]) {
            //    [mainFcuncViewController viewDidLoad];
            //}
            
            //tabBarController = mainFcuncViewController.funcsTabBarController;
            //[tabBarController viewDidLoad];
    
            
            //延續一開始tabBarController的設定畫面為0
            //這裡就可以在顯示之前點選1的畫面
            //就可以避開Navi的Bar往下掉的問題了！
            //[tabBarController loadView];
            //(@"%d",beginViewController.tabBarIndex);
            navigationController = [tabBarController.viewControllers objectAtIndex:1];
            tabBarController.selectedIndex = 1;
            [self.tabBarControllerDelegate tabBarController:self.bottomTabBarController didSelectViewController:navigationController];
            
            self.window.rootViewController = self.mainSplitViewController;
            
            self.splitPopoverController = [[UIPopoverController alloc] initWithContentViewController:[self.mainSplitViewController.viewControllers objectAtIndex:0]];
            
            
            
            //if (![[[navigationController visibleViewController] view] viewWithTag:9001]) {
                [self.mainSplitViewController.delegate splitViewController:self.mainSplitViewController willHideViewController:[self.mainSplitViewController.viewControllers objectAtIndex:0] withBarButtonItem:nil forPopoverController:self.splitPopoverController];
            //}
            
            [self windowPageTransitionAnimation:0];
            break;
        case 2:
            //餐廳簡介
            self.window.rootViewController = self.restaurantIntroViewController;
            [self windowPageTransitionAnimation:0];
            break;
        case 3:
            break;
        case 4:
            break;
    }

}

- (void) windowPageTransitionAnimation:(NSInteger)type{
        
    
    //UIView *show = [[UIView alloc] initWithFrame:CGRectMake(256, 192, 512, 384)];
    //show.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    //NSInteger alpha = 0;
    //show.alpha = alpha;
    //show.layer.cornerRadius = 70;
    //show.layer.masksToBounds = YES;
    
    //GuideViewsController *guideViewsController = [[GuideViewsController alloc] init];
    
    /*[self.window.rootViewController.view addSubview:show];
    
    [UIView beginAnimations:@"RemindShow" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:1.26];
    [UIView setAnimationDuration:1];
    */
    //UIView *view1 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //view1.alpha = 0;
    //view1.backgroundColor = [UIColor whiteColor];
    //[self.window addSubview:view1];
    //self.window.rootViewController = self.mainSplitViewController;
    [UIView beginAnimations:@"SwitchView" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    switch (type) {
        case 0:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.window cache:YES];
            //view1.alpha = 1;
            //alpha = 1;
            break;
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.window cache:YES];
            //alpha = 0;
            break;
    }
    
    [UIView commitAnimations]; 
    /*
    show.alpha = alpha;
    
    [UIView beginAnimations:@"RemindShow2" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:1.26];
    [UIView setAnimationDuration:1];
    show.alpha = 0;
    [UIView commitAnimations];
    [UIView commitAnimations];
     */
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    NSError *error = nil;
    if (managedObjectContext_ != nil) {
        if ([managedObjectContext_ hasChanges] && ![managedObjectContext_ save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            //(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"PadOrder" ofType:@"momd"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"PadOrder.sqlite"];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        //(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator_;
}


- (void)saveContext{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSString *) imagePathDocumentsDirectory{
    return [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"DishImages"];
}


- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url{
	//[[PORequestFromWebConnectionDeleagte alloc] initWitURL:url];
    [self.fb handleOpenURL:url];
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    
    [mainSplitViewController release];
    
    [managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
    
    [window release];
    [super dealloc];
}


@end

