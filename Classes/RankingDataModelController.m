//
//  RankingDataModelController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingDataModelController.h"


@implementation RankingDataModelController

- (id) init{
    self = [super init];
    if(self){
        self.entity = [NSEntityDescription entityForName:@"Ranking_Dish" inManagedObjectContext:managedObjectContext];
    }
    
    return self;
}

- (NSFetchedResultsController *) fetchedRankingResultsControllerWithRankingType:(NSInteger)type_no{
    //Delete Cache to avoid Data Error
    [NSFetchedResultsController deleteCacheWithName:@"RankingData"];
    //Create a fetch request
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    //Create somethin for request 
    NSPredicate *predicate = nil;
    
    predicate= [NSPredicate predicateWithFormat:@"Ranking_Type=%d",type_no];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Ranking_Level" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] 
                                                            initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
                                                            sectionNameKeyPath:nil
                                                            cacheName:@"RankingData"];
    
    [self performFetchedResultsController:fetchedResultsController];
    
    [fetchRequest release];
    [predicate release];
    
    return fetchedResultsController;
}

- (EntityRankingDish *)rankingDishWithDishNo:(NSString *)dish_no withType:(NSNumber *)type{
    EntityRankingDish *rankingDish = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Dish.Dish_No=%@ and Ranking_Type=%@",dish_no,type];
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Dish.Dish_No" ascending:YES];
    if (!(rankingDish = [array lastObject])) {
        
        DishDataModelController *dishModelController = [[DishDataModelController alloc] init];
        
        EntityDish *dish =  [dishModelController dishEntityWithDishNo:dish_no];  
        
        rankingDish = [[EntityRankingDish alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        rankingDish.Dish = dish;
        
        [dishModelController release];
    }
    return rankingDish;
}

@end
