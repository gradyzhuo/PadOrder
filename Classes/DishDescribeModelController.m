//
//  DishDescribeModelController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "DishDescribeModelController.h"


@implementation DishDescribeModelController

- (id) init{
    if((self = [super init])){
        self.entity = [NSEntityDescription entityForName:@"Dishes_Describe" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

- (EntityDescribe *)describeEntityWithDishNo:(NSString *)dish_no{
    EntityDescribe *describe = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Dish.Dish_No=%@",dish_no];
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Dish.Dish_No" ascending:YES];
    if (!(describe = [array lastObject])) {
        describe = [[EntityDescribe alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        //[self saveToContext];
    }
    return describe;
}


@end
