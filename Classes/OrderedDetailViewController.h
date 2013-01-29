//
//  OrderedDetailViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/9.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLViewController.h"

@class OrderedListViewController;
@interface OrderedDetailViewController : SLViewController <UINavigationControllerDelegate>{
    UIBarButtonItem *showPopoverButton;
    UIBarButtonItem *backToSelected;
}

@property (nonatomic, retain) UIBarButtonItem *showPopoverButton;
@property (nonatomic, retain) UIBarButtonItem *backToSelected;

@end
