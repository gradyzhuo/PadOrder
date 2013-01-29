//
//  DishSetModelController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/29.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "DishSetModelController.h"


@implementation DishSetModelController

- (id)init{
    self = [super init];
    if (self) {
        self.entity = [NSEntityDescription entityForName:@"Dishes_Set" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

- (EntityDishSet *) dishSetEntityWithSetNo:(NSString *)set_no{
    EntityDishSet *dishSet = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Set_No=%@",set_no];
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Set_No" ascending:YES];
    if (!(dishSet = [array lastObject])) {
        dishSet = [[EntityDishSet alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        dishSet.Set_No = set_no;
        //[self saveToContext];
    }
    return dishSet;
}


@end
