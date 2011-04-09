//
//  PadOrderLogoViewController.m
//  padOrder
//
//  Created by Grady Cho on 11/3/11.
//  Copyright 2011年 Macricho. All rights reserved.
//

#import "PadOrderLogoViewController.h"
#import <QuartzCore/QuartzCore.h>

#define HEIGHT_ADDER 21

@implementation PadOrderLogoViewController
@synthesize exitButton;
@synthesize informationLabel;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect screenFrame = [[UIScreen mainScreen] bounds];
        //CGFloat endX = (screenFrame.size.width/4);
        //CGFloat endY = (screenFrame.size.height/4);
        CGFloat width = (screenFrame.size.width/2);
        CGFloat height = (screenFrame.size.height/2);
        
        self.view.frame = CGRectMake(0, 0, width, height);
        //self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        
        //[self createInfoLabelHeight];
        //self.informationLabel.text = string;
    }
    return self;
}


- (IBAction)hideInfoView:(id)sender{
    //(@"HHHH");
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
    //self.view.backgroundColor = [UIColor whiteColor];
    //[[View layer] setCornerRadius:xx]  設圓角
    
    //CGRect contentFrame = self.informationLabel.frame;
    
    //CGPoint contentOrigin = contentFrame.origin;
    //CGSize contentSize = contentFrame.size;
    
    //self.scrollView.contentSize = contentFrame.size;
    //self.scrollView.scrollEnabled = YES;
    //self.scrollView.clipsToBounds = YES;
    //self.contentScrollView.contentSize = contentSize;
    //self.contentScrollView.frame = CGRectMake(58, 117, contentSize.width, 750);
    
    
    [[self.view layer] setCornerRadius:10];
    [[self.view layer] setBorderWidth:3];
    self.view.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.view.layer.shadowRadius = 5;
    self.view.layer.shadowOffset = CGSizeMake(5, 5);
    self.view.layer.shadowColor = [[UIColor blueColor] CGColor];
    self.view.layer.masksToBounds = YES;
    
    UIScrollView *versionView = (UIScrollView *)[self.view viewWithTag:1001];
    [[versionView layer] setCornerRadius:10];
    [[versionView layer] setMasksToBounds:YES];
    //versionView.contentSize = contentFrame.size;
    
    CGRect frame = versionView.frame;
    CGSize frameSize = frame.size;
    CGPoint framePoint = frame.origin;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, frameSize.width, HEIGHT_ADDER)];
    label.backgroundColor = [UIColor clearColor];
    
    NSMutableString *string = [NSMutableString stringWithString:@"123\n"];
    
    for (int i=0; i<20; i++) {
        [string appendFormat:@"%d\n",i];
        [self createInfoLabelHeight:label];
        label.numberOfLines++;
    }

    versionView.contentSize = label.frame.size;
    [self scrollViewContentSizeAdder:versionView];
    label.text = string;
    //label.frame.size
    [self infomationTextFromPlist:@"POInformation"];
    [versionView addSubview:label];
    
    
}

- (void) createInfoLabelHeight:(UILabel *)label{
    CGRect frame = label.frame;
    
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    label.frame = CGRectMake(x, y, width, height+HEIGHT_ADDER);
}

- (void) scrollViewContentSizeAdder:(UIScrollView *)theScrollView{
    CGSize scrollContentSize = theScrollView.contentSize;
    theScrollView.contentSize =  CGSizeMake(scrollContentSize.width, scrollContentSize.height+HEIGHT_ADDER);
}

- (NSString *)infomationTextFromPlist:(NSString *)plistName{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSLog(@"%@",dict);
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
