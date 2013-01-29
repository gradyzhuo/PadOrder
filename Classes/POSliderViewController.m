//
//  POSliderViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/5/3.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POSliderViewController.h"


@implementation POSliderViewController
@synthesize slideView;


- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void) sliderCenterFrom:(CGPoint)fromCenter to:(CGPoint)toCenter alphaFrom:(CGFloat)fromAlpha to:(CGFloat)toAlpha{
    self.slideView.center = fromCenter;
    self.view.alpha = fromAlpha;
        
    [UIView beginAnimations:@"SliderViewAnimation" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    self.view.alpha = toAlpha;
    self.slideView.center = toCenter;
    [UIView commitAnimations];
}


- (void) sliderView:(UIView *)aView frameFrom:(CGRect)from to:(CGRect)to{
    
    //[self.applicationDelegate.mainSplitViewController.view addSubview:blackView];
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
        [self sliderView:aView frameFrom:hiddenFrame to:showFrame];
        
    }
    else{
        aView.tag = 101;
        [self sliderView:aView frameFrom:showFrame to:hiddenFrame];
        
    }
}


- (void)showView:(id)sender{
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
    //self.view.frame = self.applicationDelegate.mainSplitViewController.view.frame;
        switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortraitUpsideDown:
        case UIInterfaceOrientationPortrait:
            self.view.frame = CGRectMake(0, 0, 768, 1024);
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            self.view.frame = CGRectMake(0, 0, 1024, 768);
            break;
    }
     
    CGPoint showCenter = self.view.center;
    CGFloat height = self.view.frame.size.height;
    
    CGPoint hideCenter = CGPointMake(showCenter.x, showCenter.y+height);
    
    [self.applicationDelegate.mainSplitViewController.view addSubview:self.view];
    [self sliderCenterFrom:hideCenter to:showCenter alphaFrom:0 to:1];
    
}

- (void)hideView:(id)sender{
    [self.view removeFromSuperview];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
    //self.view.frame = self.applicationDelegate.mainSplitViewController.view.frame;
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortraitUpsideDown:
        case UIInterfaceOrientationPortrait:
            self.view.frame = CGRectMake(0, 0, 768, 1024);
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            self.view.frame = CGRectMake(0, 0, 1024, 768);
            break;
    }
    
    CGPoint showCenter = self.view.center;
    CGFloat height = self.view.frame.size.height;
    
    CGPoint hideCenter = CGPointMake(showCenter.x, showCenter.y+height);
    
    [self.applicationDelegate.mainSplitViewController.view addSubview:self.view];
    [self sliderCenterFrom:showCenter to:hideCenter alphaFrom:1 to:0];
}

@end
