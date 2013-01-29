//
//  DishSetModelController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/29.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"

@interface DishSetModelController : padOrderModelObject {
    
}

- (EntityDishSet *) dishSetEntityWithSetNo:(NSString *)set_no;

@end
