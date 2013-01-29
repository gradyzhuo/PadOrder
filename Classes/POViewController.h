//
//  POViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/11/2.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "padOrderAppDelegate.h"

@interface POViewController : UIViewController {
    padOrderAppDelegate *applicationDelegate;
    UILabel *topTitleLabel;
    UIImageView *imageBgView;
}
@property (nonatomic, retain) padOrderAppDelegate *applicationDelegate;
@property (nonatomic, retain) IBOutlet UILabel *topTitleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageBgView;
- (UIImage*)imageWithShadow : (UIImage *)image;

@end
