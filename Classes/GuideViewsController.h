//
//  GuideViewsController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/22.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideBasicView.h"

@interface GuideViewsController : UIViewController {
    NSMutableArray *_views;
}

@property (nonatomic, retain) NSMutableArray *_views;

@end
