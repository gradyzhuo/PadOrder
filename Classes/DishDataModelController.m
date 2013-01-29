//
//  DishDataModelController.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/3.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "DishDataModelController.h"
#import "EntityDish.h"
#import "EntityDishKind.h"
@implementation DishDataModelController

- (id) init{
    if((self = [super init])){
        self.entity = [NSEntityDescription entityForName:@"Dishes" inManagedObjectContext:managedObjectContext];
        
    }
    return self;
}
/*
- (NSManagedObject *) entityForEntityDescription:(NSEntityDescription *)description forValue:(id)value withKey:(NSString *)key{
    
}*/

- (EntityDish *)dishEntityWithDishNo:(NSString *)dish_no{
    EntityDish *dish = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Dish_No=%@",dish_no];
    NSArray *array = [self entitiesWithPredicate:predicate sortBy:@"Dish_No" ascending:YES];
    if (!(dish = [array lastObject])) {
        dish = [[EntityDish alloc] initWithEntity:self.entity insertIntoManagedObjectContext:self.managedObjectContext];
        dish.Dish_No = dish_no;
        //[self saveToContext];
    }
    return dish;
}


- (NSFetchedResultsController *) fetchedResultsControllerGroupBySetWhereKindIs:(EntityDishKind *)kind{
    //Delete Cache to avoid Data Error
    [NSFetchedResultsController deleteCacheWithName:@"DishSet"];
    //Create a fetch request
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    //Create somethin for request 
    NSPredicate *predicate = nil;
    
    predicate= [NSPredicate predicateWithFormat:@"Kind=%@ and Type = 0 and willShow=YES",[kind objectID]];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"DishSet.Set_Name" ascending:YES];

    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];//[[NSArray alloc] initWithObjects:sortDescriptor, nil];

    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];

    [fetchRequest setResultType:NSManagedObjectResultType];

    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] 
                                                            initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
                                                            sectionNameKeyPath:@"DishSet.Set_Name" cacheName:@"DishSet"];
    
    [self performFetchedResultsController:fetchedResultsController];
    
    [fetchRequest release];
    [predicate release];
    return fetchedResultsController;
    
}

- (NSSet *) allDishes{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Dish_No" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    NSError *error = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setFetchBatchSize:20];
    
    return [NSSet setWithArray:[managedObjectContext executeFetchRequest:fetchRequest error:&error]];
}

- (NSFetchedResultsController *)fetchedResultsControllerWithSuggestDish{
    //Delete Cache to avoid Data Error
    [NSFetchedResultsController deleteCacheWithName:@"SuggestDish"];
    //Create a fetch request
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    //Create somethin for request 
    NSPredicate *predicate = nil;
    
    predicate= [NSPredicate predicateWithFormat:@"isSuggest=YES and Type=0"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"DishSet.Set_Name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];//[[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [fetchRequest setResultType:NSManagedObjectResultType];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] 
                                                            initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
                                                            sectionNameKeyPath:nil cacheName:@"SuggestDish"];
    
    
    [self performFetchedResultsController:fetchedResultsController];
    
    [fetchRequest release];
    [predicate release];
    
    return fetchedResultsController;

}

- (NSFetchedResultsController *)fetchedResultsControllerWithSearchText:(NSString *)searchText{
    //Delete Cache to avoid Data Error
    [NSFetchedResultsController deleteCacheWithName:@"SearchDish"];
    //Create a fetch request
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    //Create somethin for request 
    NSPredicate *predicate = nil;
    
    predicate= [NSPredicate predicateWithFormat:@"willShow=YES and (Dish_Name contains[c] %@ or Describe.Describe_Complete contains[c] %@ or Describe.Describe_Simple contains[c] %@)",searchText,searchText,searchText];
    //predicate = [NSPredicate predicateWithFormat:@"willShow=YES and Dish_Name contains[c] %@",searchText];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"DishSet.Set_Name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];//[[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [fetchRequest setResultType:NSManagedObjectResultType];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] 
                                                            initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
                                                            sectionNameKeyPath:nil
                                                            cacheName:@"SearchDish"];
    
    
    [self performFetchedResultsController:fetchedResultsController];
    
    [fetchRequest release];
    [predicate release];
    
    return fetchedResultsController;
    
}



/*
- (NSFetchedResultsController *) fetchedResultsControllerGroupByStatus{
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Status_No" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [NSFetchedResultsController deleteCacheWithName:@"OrderedDishes"];
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
              sectionNameKeyPath:@"Status_No" cacheName:@"OrderedDishes"];
    
    [fetchRequest release];
    return fetchedResultsController;
}
*/
- (void) dealloc{
    [super dealloc];
}

@end
