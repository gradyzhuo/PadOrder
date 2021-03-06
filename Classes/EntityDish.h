//
//  Dish.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/26.
//  Copyright 2010 Macricho. All rights reserved.
//

/*
#define KEY_DISH_NO @"Dish_No"
#define KEY_DISH_NAME @"Dish_Name"
#define KEY_HOT_INDEX @"Hot_Index"
#define KEY_UPDATE_DATE @"Update_Date"
#define KEY_IS_SUGGEST @"isSuggest"
#define KEY_WILL_SHOW @"willShow"

#define KEY_RELATION_SET @"Set"
#define KEY_RELATION_IMAGES @"Images"
#define KEY_RELATION_DESCRIBE @"Describe"
#define KEY_RELATION_KIND @"Kind"
*/
#import <Foundation/Foundation.h>
#import "EntityRefer.h"

@class EntityDescribe;
@class EntityDishSet;
@class EntityDishKind;
@class EntityImage;
@interface EntityDish : EntityRefer{

}
@property (nonatomic, retain) NSNumber *willShow;
@property (nonatomic, retain) NSArray *Images;
@property (nonatomic, retain) NSString *Dish_Name;
@property (nonatomic, retain) NSString *Dish_No;
@property (nonatomic, retain) NSDate *Update_Date;
@property (nonatomic, retain) EntityDescribe *Describe;
@property (nonatomic, retain) EntityDishSet *DishSet;
@property (nonatomic, retain) EntityDishKind *Kind;
@property (nonatomic, retain) NSNumber *Dish_Price;
@property (nonatomic, retain) NSNumber *isSuggest;
@property (nonatomic, retain) NSNumber *Type;

- (NSString *)imageEntityForMainImage;
- (NSURL *)getURLForMainImageFullPath;
- (UIImage *) imageForMainImageWithClip:(BOOL)useClip;
- (UIImage *) cuttedMainImageWithSize:(CGSize) size;

@end
