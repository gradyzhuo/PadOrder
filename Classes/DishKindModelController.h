//
//  DishKindModelController.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/29.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "padOrderModelObject.h"
#import "AllEntity.h"
#import "Stack.h"

@interface DishKindModelController : padOrderModelObject {

}

- (NSArray *)segmentTitleArrayWithTypeNo:(NSNumber *)segmentNo;
- (EntityDishKind *) dishkKindEntityWithKindNo:(NSNumber *)kind_no andSegmentType:(NSNumber *)segmentNo;
@end
