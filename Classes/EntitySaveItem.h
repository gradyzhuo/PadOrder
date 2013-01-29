//
//  EntitySaveItem.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityRefer.h"

@class EntityDish;
@class EntitySave;
@interface EntitySaveItem : EntityRefer {
    
}

@property (nonatomic, retain) NSNumber *Save_Percent;
@property (nonatomic, retain) EntityDish *Save_Dish;
@property (nonatomic, retain) EntitySave *Save_Entity;

@end
