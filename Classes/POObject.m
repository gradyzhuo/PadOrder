//
//  POObject.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/9.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "POObject.h"


@implementation POObject
@synthesize applicationDelegate;

- (id)init{
    self = [super init];
    if (self) {
        self.applicationDelegate = (padOrderAppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

@end
