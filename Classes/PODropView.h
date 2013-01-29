//
//  PODropView.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/24.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "POView.h"
//#import "DishTableCellView.h"
@class DishTableCellView;
@interface PODropView : POView {
    UIImageView *_imageView;
    DishTableCellView *_cellView;
}

@property (nonatomic, retain) UILabel *dishNameLabel;
@property (nonatomic) NSInteger orderCount;
@property (nonatomic, retain) UILabel *dishOrderCountLabel;

- (id) initWithImage:(UIImage *)image andCellView:(DishTableCellView *)cellView;
- (void) closeImageView:(id)sender;
- (void) addCount:(id)sender;
- (void) subCount:(id)sender;

@end
