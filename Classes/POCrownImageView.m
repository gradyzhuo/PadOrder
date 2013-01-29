//
//  POCrownImageView.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/10.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POCrownImageView.h"


@implementation POCrownImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //self.transform = CGAffineTransformMakeRotation(0.5);
}


- (void)dealloc
{
    [super dealloc];
}

@end
