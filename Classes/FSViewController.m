//
//  FSViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "FSViewController.h"


@implementation FSViewController

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
    [super viewDidLoad];
    self.imageBgView.image = [self imageWithShadow:self.imageBgView.image];
    //[self.view insertSubview:backgroundView aboveSubview:self.view];
    //[self.view addSubview:backgroundView];
    self.topTitleLabel.transform = CGAffineTransformMakeRotation(-0.05f);
    self.topTitleLabel.font = [UIFont fontWithName:@"Zapfino" size:45];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-pattern.png"]];
    
    //NSString *memberName = [self.applicationDelegate.standardUserDefaults objectForKey:@"MEMBER_NAME"];
    //if([memberName isEqualToString:@"訪客"])
    //    self.navigationItem.prompt = nil;
    //else
    //    self.navigationItem.prompt = [NSString stringWithFormat:@"%@,您好",memberName];
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
