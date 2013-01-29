//
//  GuideViewsController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/22.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "GuideViewsController.h"


@implementation GuideViewsController
@synthesize _views;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {
        _views = [NSMutableArray array];
        NSArray *titles = [NSArray arrayWithObjects:@"SET",@"C7", nil];
        for (NSString *title in titles) {
            GuideBasicView *view = [[GuideBasicView alloc] initWithFrame:CGRectMake(500, 500, 600, 1000)];
            view.backgroundColor = [UIColor whiteColor];
            [_views addObject:view];
        }
        
    }
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
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *beforeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    skipButton.tag = 0;
    beforeButton.tag = 1;
    continueButton.tag = 2;
    
    [beforeButton setTitle:@"上一則" forState:UIControlStateNormal];
    [continueButton setTitle:@"繼續" forState:UIControlStateNormal];
    [skipButton setTitle:@"略過" forState:UIControlStateNormal];
    
    [self.view addSubview:beforeButton];
    [self.view addSubview:continueButton];
    [self.view addSubview:skipButton];
    
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
