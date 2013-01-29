//
//  PadOrder_Unittest.m
//  PadOrder_Unittest
//
//  Created by Zhuo Ting-Rui on 2011/4/20.
//  Copyright 2011年 逢甲大學資訊工程學系. All rights reserved.
//

#import "PadOrder_Unittest.h"


@implementation PadOrder_Unittest

- (void)setUp
{
    [super setUp];
    array = [NSArray arrayWithObjects:@"1",@"12",@"3", nil];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    
    STAssertEqualObjects([array objectAtIndex:1], @"2",@"???");
    NSString *string1 = @"test";
    NSString *string2 = @"test";
    STAssertEquals(string1,
                   string2,
                   @"FAILURE");
    NSUInteger uint_1 = 4;
    NSUInteger uint_2 = 4;
    STAssertEquals(uint_1,
                   uint_2,
                   @"FAILURE");
    
    //STAssertTrue(@"TEST");
    //STFail(@"Unit tests are not implemented yet in PadOrder_Unittest");
}

@end
