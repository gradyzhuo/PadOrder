//
//  POMoreImageViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/15.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POMoreImageViewController.h"

@interface UISplitViewController(Rotate)

@end
@implementation UISplitViewController(Rotate)


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    if ([self.view viewWithTag:9] != nil) {
        if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) return YES;
        return NO;
    }
    return YES;
}

@end

@implementation POMoreImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)close:(id)sender{
    [self.applicationDelegate sliderView:self.view beShow:NO];
    [[self.view viewWithTag:9] performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1];
    //[[self.view viewWithTag:9] removeFromSuperview];
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
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:button0];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    [self.view addSubview:button6];
    [self.view addSubview:button7];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

@end
