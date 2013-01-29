//
//  MemberSaveModelController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"

@interface MemberSaveModelController : padOrderModelObject {
    
}

- (NSFetchedResultsController *)fetchedSaveResultsControllerWithID:(NSString *)member_id;

@end
