//
//  POSliderViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/5/3.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POBlackBackgroundViewController.h"

@interface POSliderViewController : POBlackBackgroundViewController {
    UIView *slideView;
}

@property (nonatomic, retain) IBOutlet UIView *slideView;

- (void) sliderView:(UIView *)aView beShow:(BOOL)show;
- (void) sliderView:(UIView *)aView frameFrom:(CGRect)from to:(CGRect)to;
- (void) sliderCenterFrom:(CGPoint)fromCenter to:(CGPoint)toCenter alphaFrom:(CGFloat)fromAlpha to:(CGFloat)toAlpha;
- (IBAction) showView:(id)sender;
- (IBAction) hideView:(id)sender;


@end
