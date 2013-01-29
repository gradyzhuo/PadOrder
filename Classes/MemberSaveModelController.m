//
//  MemberSaveModelController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "MemberSaveModelController.h"


@implementation MemberSaveModelController

- (id) init{
    self = [super init];
    if(self){
        self.entity = [NSEntityDescription entityForName:@"Member_Save" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

/*
- (EntityMember *)fetchMemberEntityWithID:(NSString *)member_id{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Member_ID=%@",member_id];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:self.entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return [array lastObject];
}
*/

- (NSFetchedResultsController *)fetchedSaveResultsControllerWithID:(NSString *)member_id{
    //Delete Cache to avoid Data Error
    [NSFetchedResultsController deleteCacheWithName:@"MemberSave"];
    //Create a fetch request
    NSFetchRequest  *fetchRequest = [self createSimpleFetchRequest];
    //Create somethin for request 
    NSPredicate *predicate = nil;
    
    predicate= [NSPredicate predicateWithFormat:@"Member.Member_ID = %@",member_id];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Save.Save_No" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] 
                                                            initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext 
                                                            sectionNameKeyPath:nil
                                                            cacheName:@"MemberSave"];
    
    [self performFetchedResultsController:fetchedResultsController];
    
    [fetchRequest release];
    [predicate release];
    
    return fetchedResultsController;
    
}

@end
