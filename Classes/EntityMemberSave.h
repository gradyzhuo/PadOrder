//
//  EntityMemberSave.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/22.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityRefer.h"
#import "EntityMember.h"
#import "EntitySave.h"

@class EntitySave;
@class EntityMember;
@interface EntityMemberSave : EntityRefer {
    
}

@property (nonatomic, retain) EntityMember *Member;
@property (nonatomic, retain) EntitySave *Save;

@end

