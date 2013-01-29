//
//  POView.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/24.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POView.h"


@implementation POView
@synthesize applicationDelegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (padOrderAppDelegate *)applicationDelegate{
    return (padOrderAppDelegate *)[[UIApplication sharedApplication] delegate];
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
