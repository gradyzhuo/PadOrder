//
//  POScrollViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POScrollViewController.h"


@implementation POScrollViewController
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    originContentFrame = self.scrollView.frame;
    self.scrollView.contentSize = self.scrollView.frame.size;
    self.scrollView.frame = CGRectMake(58, 117, originContentFrame.size.width, 750);
    [self.view addSubview:self.scrollView];
    [super viewDidLoad];
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
    BOOL result = [self resetContentScrollFrame:self.scrollView WithOrientation:interfaceOrientation];
	return result;
}

- (BOOL)resetContentScrollFrame:(UIScrollView *)scrollView WithOrientation:(UIInterfaceOrientation)interfaceOrientation{
    BOOL result = YES;
    
    CGRect bgFrame = self.imageBgView.frame;
    CGPoint bgOrigin = bgFrame.origin;
    CGSize bgSize = bgFrame.size;
    CGFloat bgHeight = self.view.frame.size.height;
    
    CGSize contentSize = scrollView.contentSize;
    CGRect scrollFrame = scrollView.frame;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            scrollView.contentSize = CGSizeMake(652, contentSize.height);
            scrollView.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y, 652, contentSize.height);
            self.imageBgView.frame = CGRectMake(bgOrigin.x, bgOrigin.y, bgSize.width, 911);
            break;
        default:
            self.imageBgView.frame = CGRectMake(bgOrigin.x, bgOrigin.y, bgSize.width, 655);
            scrollView.contentSize = CGSizeMake(596, contentSize.height);
            scrollView.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y, 596, contentSize.height);
            result = NO;
            break;
    }    
    return result;
}

@end
