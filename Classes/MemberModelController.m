//
//  MemberModelController.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "MemberModelController.h"
#import "EntityMember.h"

@implementation MemberModelController

- (id) init{
    self = [super init];
    if(self){
        self.entity = [NSEntityDescription entityForName:@"Members" inManagedObjectContext:managedObjectContext];
    }
    return self;
}

- (EntityMember *)fetchMemberEntityWithID:(NSString *)member_id{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Member_ID=%@",member_id];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:self.entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return [array lastObject];
}

- (EntityMember *)loginMemberID:(NSString *)member_id andPassword:(NSString *)password{
    EntityMember *member = [self fetchMemberEntityWithID:member_id];
    if ([member.Password isEqualToString:password]) {
        return member;
    }
    return NO;
}

@end
