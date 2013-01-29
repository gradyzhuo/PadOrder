//
//  EntityMember.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityRefer.h"

@class EntitySave;
@interface EntityMember : EntityRefer {
    
}

@property (nonatomic, retain) NSString *Member_ID;
@property (nonatomic, retain) NSString *Member_Lavel;
@property (nonatomic, retain) NSString *Member_Name;
@property (nonatomic, retain) NSString *Member_Phone;
@property (nonatomic, retain) NSString *Password;
//@property (nonatomic, retain) EntitySave *Have_Save;

@end
