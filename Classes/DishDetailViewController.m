    //
//  DishDetailViewController.m
//  padOrder
//
//  Created by Macric Cho on 2010/11/1.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "DishDetailViewController.h"
#import "DishImagesModelController.h"
#import <QuartzCore/QuartzCore.h>

@implementation DishDetailViewController
@synthesize navigationBar;
@synthesize dishDescription;
@synthesize moreImageScrollView;
@synthesize dishImageView;
@synthesize dishTitle;
@synthesize dishPrice;
@synthesize addButton;
@synthesize tableViewController;
@synthesize contentScrollView;
@synthesize indexPath;
@synthesize introDish;
@synthesize imageModelController;
@synthesize beforeViewController;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.


-(id)initWithDish:(EntityDish *)dish{
    self = [super initWithNibName:@"DishDetailView" bundle:[NSBundle mainBundle]];
    if (self) {
        self.introDish = dish;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-pattern.png"]];
        self.topTitleLabel.text = @"Introduction";
        self.imageModelController = [[DishImagesModelController alloc] init];
        
    }
    return self;
}

- (void) backToMenu:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [self.beforeViewController.view addSubview:[self.view viewWithTag:9001]];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"返回";
    self.title = @"餐點介紹";
    
    self.dishImageView.layer.cornerRadius = 10;
    //self.dishImageView.layer.borderWidth = 2;
    //self.dishImageView.layer.borderColor = [[UIColor brownColor] CGColor];
    self.dishImageView.layer.masksToBounds = YES;
    
    self.moreImageScrollView.layer.cornerRadius = 10;
    self.moreImageScrollView.layer.masksToBounds = YES;
    
    self.contentScrollView.alwaysBounceVertical = YES;
    self.contentScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
        //self.moreImageScrollView.canCancelContentTouches = NO;
    self.moreImageScrollView.clipsToBounds = YES;
    self.moreImageScrollView.alwaysBounceHorizontal = YES;
        //self.moreImageScrollView.alwaysBounceVertical = YES;
    self.moreImageScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewBackground.png"]];
    //[self.moreImageScrollView addSubview:imageView];
    //self.moreImageScrollView.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
    self.moreImageScrollView.scrollEnabled = YES;
	self.addButton.isDetail = YES;
    self.addButton.indexPath = self.indexPath;
    //[self.addButton addTarget:self.tableViewController action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
	////(@"2:%@",self.tableViewController);
	//[self.addButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    //NSLog(@"9001View:%@",self.beforeViewController);
    
    
    //[self.view addSubview:[self.beforeViewController.view viewWithTag:9001]];
    
    CGRect contentFrame = self.contentScrollView.frame;
    //CGPoint contentOrigin = contentFrame.origin;
    CGSize contentSize = contentFrame.size;
    
    self.contentScrollView.contentSize = contentSize;
    self.contentScrollView.frame = CGRectMake(58, 117, contentSize.width, 750);
    [self.view addSubview:self.contentScrollView];
    
    
    //CGPoint moreIVPoint = self.moreImageScrollView.frame.origin;
    //CGSize moreIVSize = self.moreImageScrollView.frame.size;
    
    
    
    //CGPoint firstImagePoint = CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
    NSArray *imagesArray = [self.imageModelController getImagesWithDish:self.introDish];
    for (EntityImage *imageEntity in imagesArray) {
        NSString *fullPath = [self.imageModelController getFullPathWithImageEntity:imageEntity];
        UIImage *image = [UIImage imageWithContentsOfFile:fullPath];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(0, 0, 0, 0);
        
        [self.moreImageScrollView addSubview:imageView];
        
    }
    self.imageBgView.image = [self imageWithShadow:self.imageBgView.image];
    //[self.view addSubview:self.addButton];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //NSLog(@"%@",self.navigationController.navigationBar.topItem);
    //NSLog(@"%@",self.navigationController.navigationBar.topItem);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    BOOL result = [self resetContentScrollFrameWithOrientation:interfaceOrientation];
    //NSLog(@"array:%@",[self.imageModelController getImagesWithDish:self.introDish]);
    return result;
}

- (BOOL)resetContentScrollFrameWithOrientation:(UIInterfaceOrientation)interfaceOrientation{
    CGRect bgFrame = self.imageBgView.frame;
    CGPoint bgOrigin = bgFrame.origin;
    CGSize bgSize = bgFrame.size;
    CGFloat bgHeight = self.view.frame.size.height;
    
    CGSize contentSize = contentScrollView.contentSize;
    
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            self.contentScrollView.contentSize = CGSizeMake(652, contentSize.height);
            //self.imageBgView.frame = CGRectMake(bgOrigin.x, bgOrigin.y, bgSize.width, 1028);
            return YES;
            break;
        default:
            //self.imageBgView.frame = CGRectMake(bgOrigin.x, bgOrigin.y, bgSize.width, screenFrame.size.width);
            self.contentScrollView.contentSize = CGSizeMake(596, contentSize.height);
            ////(@"rotate Land");
            return NO;
            break;
    }

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
    //(@"UNLOAD");
}


- (void)dealloc {
    [super dealloc];
}

@end
