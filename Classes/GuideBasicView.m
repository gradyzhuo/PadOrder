//
//  GuideBasicView.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/23.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "GuideBasicView.h"


@implementation GuideBasicView
@synthesize titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [self addSubview:self.titleLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
