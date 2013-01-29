//
//  EntityRankingDish.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/27.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityRefer.h"

@class EntityDish;
@interface EntityRankingDish : EntityRefer {
    
}

@property (nonatomic, retain) NSNumber *Order_Count;
@property (nonatomic, retain) NSNumber *Ranking_Level;
@property (nonatomic, retain) NSNumber *Ranking_Type;
@property (nonatomic, retain) EntityDish *Dish;

@end
