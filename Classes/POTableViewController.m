//
//  POTableViewController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/12.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POTableViewController.h"


@implementation POTableViewController
@synthesize applicationDelegate;

- (padOrderAppDelegate *)applicationDelegate{
    return (padOrderAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (UIImage *) image:(UIImage *)image reSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
