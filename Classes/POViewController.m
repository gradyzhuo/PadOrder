    //
//  POViewController.m
//  padOrder
//
//  Created by Macric Cho on 2010/11/2.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "POViewController.h"
#import "padOrderAppDelegate.h"

@implementation POViewController
@synthesize topTitleLabel;
@synthesize imageBgView;
@synthesize applicationDelegate;

- (UIImage*)imageWithShadow : (UIImage *)image{
    CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = CGImageGetBitsPerComponent(image.CGImage);
    if (bitsPerComponent == 0) bitsPerComponent = 8;
    
    CGContextRef shadowContext = CGBitmapContextCreate(NULL, image.size.width + 10, image.size.height + 10, bitsPerComponent, 0, 
                                                       colourSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colourSpace);
    
    CGContextSetShadowWithColor(shadowContext, CGSizeMake(5, -5), 5, [UIColor blackColor].CGColor);
    CGContextDrawImage(shadowContext, CGRectMake(0, 10, image.size.width, image.size.height), image.CGImage);
    
    CGImageRef shadowedCGImage = CGBitmapContextCreateImage(shadowContext);
    CGContextRelease(shadowContext);
    
    UIImage * shadowedImage = [UIImage imageWithCGImage:shadowedCGImage];
    CGImageRelease(shadowedCGImage);
    
    return shadowedImage;
}



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
        //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-pattern.png"]];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    [super loadView];
    NSLog(@"load");
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.applicationDelegate = (padOrderAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.frame];
    //backgroundView.image = [UIImage imageNamed:@"tableViewBackground.png"];
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
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
    self.topTitleLabel = nil;
    self.imageBgView = nil;
    self.applicationDelegate = nil;
}


- (void)dealloc {
    [super dealloc];
}




@end
