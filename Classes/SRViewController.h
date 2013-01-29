//
//  SRViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSViewController.h"

@interface SRViewController : FSViewController {
    UISegmentedControl *segmentControl;
}

@property (nonatomic, retain) IBOutlet UILabel *pageTitleLabel;
@property (nonatomic, retain) IBOutlet UIToolbar *functionsToolBar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

- (void) setPageTitleLabelFontSizeWithInterfaceOrientation:(UIInterfaceOrientation) interfaceorientation;

@end
