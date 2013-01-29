//
//  DishDescribeModelController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"

@interface DishDescribeModelController : padOrderModelObject {
    
}

- (EntityDescribe *)describeEntityWithDishNo:(NSString *)dish_no;

@end
