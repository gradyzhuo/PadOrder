//
//  POTabBar.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/22.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POTabBar.h"


@implementation POTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //self.backgroundColor = [UIColor blueColor];
    
    //CGRect frame = CGRectMake(self., 0, self.frame.size.width, self.frame.size.height);
    //UIView *v = [[UIView alloc] initWithFrame:frame];
    //UIImage *i = [UIImage imageNamed:@"tabbar_pixel_1.png"];
    //UIColor *c = [[UIColor alloc] initWithPatternImage:i];
    //v.backgroundColor = c;
    //[c release];
    //[[self tabBar] addSubview:v];
    //[v release];
    
}*/


- (void)dealloc
{
    [super dealloc];
}

@end
