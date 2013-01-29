//
//  EntitiesDataManagerController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllModalController.h"
#import "AllEntity.h"
#import "POObject.h"
@interface EntitiesDataManagerController : POObject {
    
}

- (EntityDishSet *) createDishSetEntityWithDict:(NSDictionary *)dataDict withSetNo:(NSString *)set_no;
- (EntityDish *) createDishEntityWithDict:(NSDictionary *)dataDict withDishNo:(NSString *)dish_no;
- (EntityDescribe *) createDescribeEntityWithDict:(NSDictionary *)dataDict withDishNo:(NSString *)dish_no;
- (EntityDishKind *) createDishKindEntityWithDict:(NSDictionary *)dataDict;
- (void)createImageEntityWithArray:(NSArray *)dataArray withDish:(EntityDish *)dish;
- (void) createRankingEntityWithDict:(NSDictionary *)dict withRankingType:(NSNumber *)type;
@end
