//
//  padOrderSegmentSetupController.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "padOrderSegmentSetupController.h"
#import "EntityDishKind.h"
#import "DishDataModelController.h"
#import "MenuViewController.h"

@implementation padOrderSegmentSetupController
@synthesize dishViewController;
@synthesize tableView;
@synthesize fetchedResultsController;

#pragma mark -
#pragma mark Self-Method

- (id) initWithController:(SRViewController *)Controller andTableView:(UITableView *)aTableView{
    self = [super init];
    if(self){
        self.dishViewController = Controller;
        self.tableView = aTableView;
        //self.tableView.allowsSelection = NO;
    }
    return self;
}

- (IBAction) changeSegmentSelect:(id)sender{
    
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    
    //The count of section in table view have to be over zero
    
    NSFetchedResultsController *fetchedResultController =  [self.dishViewController refreshFetchedResultsControllerWithIndex:self.dishViewController.segmentControl.selectedSegmentIndex];
    //NSLog(@"%d",[self.tableView numberOfRowsInSection:0]);
    
    [self resetSegmentControl:segmentControl withFontSize:20 andType:1];
    
    if([[fetchedResultController fetchedObjects] count]>0){
        NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];

        [self.tableView scrollToRowAtIndexPath:topIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [self.tableView reloadData];
    }
}

- (void) segmentControl:(UISegmentedControl *)segmentControl setTitles:(NSArray *)array{
    
    [segmentControl removeAllSegments];
    
    [segmentControl addTarget:self action:@selector(changeSegmentSelect:) forControlEvents:UIControlEventValueChanged];
    
    //segmentControl.segmentedControlStyle = UISegmentedControlStyleBezeled;
    
    NSUInteger i, count = [array count];
    for (i = 0; i < count; i++) {
        NSString *title = [(EntityDishKind *)[array objectAtIndex:i] Kind_Name];
        [segmentControl insertSegmentWithTitle:title atIndex:i animated:YES];
        [title release];
    }
    NSLog(@"1112345");
    [self resetSegmentControl:segmentControl withFontSize:20 andType:0];
    //此行會執行一次選資料的動作
    segmentControl.selectedSegmentIndex = 0;
    [self changeSegmentSelect:segmentControl];
    
    NSLog(@"%@",self.tableView);
    //[segmentControl setSelectedSegmentIndex:0];
}


- (void) resetSegmentControl:(UISegmentedControl *)segmentControl withFontSize:(NSInteger)size andType:(NSInteger)type{
    for (UIView *segment  in segmentControl.subviews) {
        UILabel *segmentLabel = [segment.subviews objectAtIndex:0];
        //segmentLabel.font = [UIFont fontWithName:segmentLabel.font.fontName size:size];
        if(type == 0) {
            segmentLabel.frame = CGRectMake(segmentLabel.frame.origin.x-10, segmentLabel.frame.origin.y, segmentLabel.frame.size.width+30, segmentLabel.frame.size.height);
        }
    }
}

@end
