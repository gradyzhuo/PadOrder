//
//  RankingDataModelController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"
#import "DishDataModelController.h"

@interface RankingDataModelController : padOrderModelObject {
    
}

- (NSFetchedResultsController *) fetchedRankingResultsControllerWithRankingType:(NSInteger)type_no;

- (EntityRankingDish *) rankingDishWithDishNo:(NSString *)dish_no withType:(NSNumber *)type;

@end
