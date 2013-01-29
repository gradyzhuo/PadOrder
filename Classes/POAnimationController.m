//
//  POAnimationController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/16.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POAnimationController.h"


@implementation POAnimationController

+ (UIImage *) screenshotWithView:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 1);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
