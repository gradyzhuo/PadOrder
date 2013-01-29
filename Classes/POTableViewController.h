//
//  POTableViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/12.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "padOrderAppDelegate.h"

@interface POTableViewController : UITableViewController {
    padOrderAppDelegate *applicationDelegate;
}

@property (nonatomic, retain) padOrderAppDelegate *applicationDelegate;

- (UIImage *) image:(UIImage *)image reSize:(CGSize)newSize;

@end
