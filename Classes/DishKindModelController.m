//
//  DishKindModelController.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/29.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "DishKindModelController.h"


@implementation DishKindModelController

#pragma mark -
#pragma mark Initialization

- (id) init{
    if(self = [super init]){
        self.entity = [NSEntityDescription entityForName:@"Dish_Kind" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

- (NSArray *)segmentTitleArrayWithTypeNo:(NSNumber *)segmentNo{
    //(@"1");

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Segment_Type=%@",segmentNo];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Dish_Kind" inManagedObjectContext:managedObjectContext]];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"Kind_No" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    [fetchRequest setPredicate:predicate];
    NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:nil];

    return array;
}

- (EntityDishKind *) dishkKindEntityWithKindNo:(NSNumber *)kind_no andSegmentType:(NSNumber *)segmentNo{
    EntityDishKind *dishKind = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Kind_No=%@ and Segment_Type = %@",kind_no,segmentNo];
    
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Kind_No" ascending:YES];
    if (!(dishKind = [array lastObject])) {
        dishKind = [[EntityDishSet alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        dishKind.Kind_No = kind_no;
        dishKind.Segment_Type = segmentNo;
        //[self saveToContext];
    }
    return dishKind;
}


@end
