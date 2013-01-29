//
//  MemberModelController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"

@interface MemberModelController : padOrderModelObject {
    
} 

- (EntityMember *) fetchMemberEntityWithID:(NSString *)member_id; 
- (EntityMember *) loginMemberID:(NSString *)member_id andPassword:(NSString *)password; 

@end
