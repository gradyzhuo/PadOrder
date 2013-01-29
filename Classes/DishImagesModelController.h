//
//  DishImagesModelController.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/30.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "EntityDish.h"
#import "EntityImage.h"

@interface DishImagesModelController : padOrderModelObject {

}

- (NSArray *)getImagesWithDish:(EntityDish *)dish;
- (NSString *) getFullPathWithImageEntity:(EntityImage *)imageEntity;
- (EntityImage *) imageEntityWithDishNo:(NSString *)dish_no;

@end
