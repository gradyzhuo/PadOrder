//
//  EntitySave.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityRefer.h"

@interface EntitySave : EntityRefer {
    
}

@property (nonatomic, retain) NSNumber *Save_No;
@property (nonatomic, retain) NSString *Save_Name;
@property (nonatomic, retain) NSNumber *Save_Degree;
@property (nonatomic, retain) NSString *Save_Type;
@property (nonatomic, retain) NSDate *Save_Deadline;
/*
 Save Type:分兩個字元
    E:代表直接優惠金額
    P:代表優惠百分比
 
    S:代表用於特定項目
    A:代表優惠全部已點清單
    G:代表特定群組優惠
    複合使用ex.ES,EA,EG
 */
@end
