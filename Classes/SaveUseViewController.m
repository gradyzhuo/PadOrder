//
//  SaveUseViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/27.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "SaveUseViewController.h"


@implementation SaveUseViewController
@synthesize idTextField;
@synthesize passwordTextField;
@synthesize warningTextLabel;
@synthesize tableView;
@synthesize waittingView;
@synthesize succesLoginView;
@synthesize loginButton;
@synthesize passButton;
@synthesize useButton;


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

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
