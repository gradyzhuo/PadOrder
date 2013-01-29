//
//  POObject.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/9.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderAppDelegate.h"

@interface POObject : NSObject {
    padOrderAppDelegate *applicationDelegate;
}

@property (nonatomic, retain) padOrderAppDelegate *applicationDelegate;

@end
