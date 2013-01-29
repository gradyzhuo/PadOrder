//
//  SRViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "SRViewController.h"


@implementation SRViewController
@synthesize pageTitleLabel;
@synthesize functionsToolBar;
@synthesize segmentControl;

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
    //self.pageTitleLabel.text = self.title;
    //self.pageTitleLabel.transform = CGAffineTransformMakeRotation(-0.07);
    //self.pageTitleLabel.adjustsFontSizeToFitWidth = NO;
    //self.pageTitleLabel.autoresizingMask = UIViewAutoresizingNone;
    //self.pageTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //self.functionsToolBar.layer.cornerRadius = 5;
    //self.functionsToolBar.layer.masksToBounds = YES;
    //self.functionsToolBar.layer.borderWidth = 1.5;
    //self.functionsToolBar.layer.borderColor = [[UIColor brownColor] CGColor];

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

- (void)setPageTitleLabelFontSizeWithInterfaceOrientation:(UIInterfaceOrientation)interfaceorientation{
    if (interfaceorientation == UIInterfaceOrientationPortrait || interfaceorientation == UIInterfaceOrientationPortraitUpsideDown) {
        self.pageTitleLabel.font = [UIFont fontWithName:self.pageTitleLabel.font.fontName size:40];
    }
    else{
        self.pageTitleLabel.font = [UIFont fontWithName:self.pageTitleLabel.font.fontName size:60];
    }
}

@end
