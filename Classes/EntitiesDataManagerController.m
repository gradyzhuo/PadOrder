//
//  EntitiesDataManagerController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/28.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "EntitiesDataManagerController.h"


@implementation EntitiesDataManagerController

- (EntityDishSet *) createDishSetEntityWithDict:(NSDictionary *)dataDict withSetNo:(NSString *)set_no{
    DishSetModelController *dishSetModel = [[DishSetModelController alloc] init];
    EntityDishSet *dishSet = [dishSetModel dishSetEntityWithSetNo:set_no];
    dishSet.Set_Name = [dataDict objectForKey:@"Set_Name"];
    dishSet.Set_Note = [dataDict objectForKey:@"Set_Note"];
    //[dishSetModel saveToContext];
    [dishSetModel release];
    return dishSet;
}

- (EntityDishKind *) createDishKindEntityWithDict:(NSDictionary *)dataDict{
    DishKindModelController *dishKindModel = [[DishKindModelController alloc] init];
    EntityDishKind *dishKind = [dishKindModel dishkKindEntityWithKindNo:[dataDict objectForKey:@"Kind_No"] andSegmentType:[dataDict objectForKey:@"Segment_Type"]];
    dishKind.Kind_Name = [dataDict objectForKey:@"Kind_Name"];
    dishKind.Will_Show = [dataDict objectForKey:@"Will_Show"];
    //[dishKindModel saveToContext];
    
    [dishKindModel release];
    return dishKind;
}

- (EntityDescribe *) createDescribeEntityWithDict:(NSDictionary *)dataDict withDishNo:(NSString *)dish_no{ 
    DishDescribeModelController *describeModel = [[DishDescribeModelController alloc] init];
    EntityDescribe *describe = [describeModel describeEntityWithDishNo:dish_no];
    describe.Describe_Simple = [dataDict objectForKey:@"Simple"];
    describe.Describe_Complete = [dataDict objectForKey:@"Complete"];
    //[describeModel saveToContext];
    
    [describeModel release];
    return describe;
}

- (void)createImageEntityWithArray:(NSArray *)dataArray withDish:(EntityDish *)dish {
    DishImagesModelController *imageModel = [[DishImagesModelController alloc] init];
    
    for (NSDictionary *imageDict in dataArray) {
        EntityImage *image = [imageModel imageEntityWithDishNo:dish.Dish_No];
        NSString *filename = [imageDict objectForKey:@"filename"];
        BOOL isMain = (BOOL)[imageDict valueForKey:@"Is_Main"];
        NSString *path = [imageDict objectForKey:@"path"];
        
        image.Image_FileName = filename;
        image.Image_Path = path;
        image.IsMainImage = [NSNumber numberWithBool:isMain];
        image.Dish = dish;
    }
    
    
}


- (EntityDish *) createDishEntityWithDict:(NSDictionary *)dataDict withDishNo:(NSString *)dish_no{
    DishDataModelController *dishModel = [[DishDataModelController alloc] init];
    DishDescribeModelController *describeModel = [[DishDescribeModelController alloc] init];
    DishImagesModelController *imageModel = [[DishImagesModelController alloc] init];
    DishSetModelController *dishSetModel = [[DishSetModelController alloc] init];
    DishKindModelController *dishKindModel = [[DishKindModelController alloc] init];
    
    EntityDish *dish = [dishModel dishEntityWithDishNo:dish_no];
    EntityDescribe *describe = [self createDescribeEntityWithDict:[dataDict objectForKey:@"Describe"] withDishNo:dish_no];
    //EntityDishSet *dishSet = [dishSetModel dishSetEntityWithSetNo:[[dataDict objectForKey:@"Dish_Set"] objectForKey:@"Set_No"]];
    
    NSDictionary *setDict = [dataDict objectForKey:@"Dish_Set"];
    
    
    EntityDishSet *dishSet = [self createDishSetEntityWithDict:setDict withSetNo:[setDict objectForKey:@"Set_No"]];
    
    EntityDishKind *dishKind = [dishKindModel dishkKindEntityWithKindNo:[dataDict objectForKey:@"Dish_Kind"] andSegmentType:[dataDict objectForKey:@"Segment_No"]];
    
    
    BOOL isSuggest = (BOOL)[dataDict objectForKey:@"isSuggest"];
    BOOL willShow = (BOOL)[dataDict objectForKey:@"willShow"];
    
    
    dish.Type = [dataDict objectForKey:@"Type"];
    dish.Dish_Name = [dataDict objectForKey:@"Dish_Name"];
    dish.Dish_Price = [dataDict objectForKey:@"Dish_Price"];
    dish.isSuggest = [dataDict objectForKey:@"isSuggest"];
    dish.Update_Date = [NSDate date];
    dish.willShow = [NSNumber numberWithBool:willShow];
    dish.Describe = describe;
    dish.DishSet = dishSet;
    dish.Kind = dishKind;  
    describe.Dish = dish;

    [self createImageEntityWithArray:[dataDict objectForKey:@"Images"] withDish:dish];
    
    //[dishModel saveToContext];
    
    return dish;
}


- (void) createRankingEntityWithDict:(NSDictionary *)dict withRankingType:(NSNumber *)type{
    RankingDataModelController *rankingDataModel = [[RankingDataModelController alloc] init];
    EntityRankingDish *rankindDish = nil;
    for (NSString *dish_no in [dict allKeys]) {
        
        NSDictionary *dish_dict = [dict objectForKey:dish_no];
        
        rankindDish = [rankingDataModel rankingDishWithDishNo:dish_no withType:type];
        rankindDish.Ranking_Type = type;
        rankindDish.Ranking_Level = [dish_dict objectForKey:@"Ranking_Level"];
        rankindDish.Order_Count = [dish_dict objectForKey:@"Order_Count"];
    }
    
    [rankingDataModel release];
}

@end
