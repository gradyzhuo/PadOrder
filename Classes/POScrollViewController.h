//
//  POScrollViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POViewController.h"

@interface POScrollViewController : POViewController {
    CGRect originContentFrame;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (BOOL)resetContentScrollFrame:(UIScrollView *)scrollView WithOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
