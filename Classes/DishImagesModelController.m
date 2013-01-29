//
//  DishImagesModelController.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/30.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "DishImagesModelController.h"


@implementation DishImagesModelController

- (id)init{
    self = [super init];
    if (self) {
        self.entity = [NSEntityDescription entityForName:@"Dishes_Images" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

- (EntityImage *) imageEntityWithDishNo:(NSString *)dish_no{
    EntityImage *image = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Dish.Dish_No=%@",dish_no];
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Dish.Dish_No" ascending:YES];
    if (!(image = [array lastObject])) {
        image = [[EntityImage alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        //[self saveToContext];
    }
    return image;
}


- (NSArray *)getImagesWithDish:(EntityDish *)dish{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:[self.entity name] inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:valueKey ascending:asc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Dish = %@",dish];
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setPredicate:predicate];
    //[fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    return [self executeFetchRequest:fetchRequest];
}

- (NSString *)getFullPathWithImageEntity:(EntityImage *)imageEntity{
    NSURL *url = [[self.appDelegateObject applicationDocumentsDirectory] URLByAppendingPathComponent:imageEntity.Image_Path];
    url = [url URLByAppendingPathComponent:imageEntity.Image_FileName];
    return [url path];
}

@end
