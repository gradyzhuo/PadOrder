//
//  EntityDishKind.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/29.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "EntityDishKind.h"


@implementation EntityDishKind
@dynamic Kind_Name;
@dynamic Kind_No;
@dynamic Segment_Type;
@dynamic Will_Show;

+ (NSFetchRequest *) fetchAllShowKind{
    NSFetchRequest *request = [self fetchRequestTemplateForName:@"allShowKind"];
    return request;
}

@end
