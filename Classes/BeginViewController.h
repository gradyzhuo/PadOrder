//
//  BeginViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/10/18.
//  Copyright 2010 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "POLandscapeViewController.h"
#import "PadOrderLogoViewController.h"
@interface BeginViewController :POViewController<UIAlertViewDelegate> {
    UIButton *infoButton;
    NSInteger nextIndex;
    PadOrderLogoViewController *logoViewController;
    UIView *blackView;
    UINavigationController *testController;
    UILabel *currentUser;
    UILabel *restaurtantNameLabel;
}

@property (nonatomic, retain) IBOutlet UIButton *infoButton;
@property (nonatomic) NSInteger tabBarIndex;
@property (nonatomic, retain) PadOrderLogoViewController *logoViewController;
@property (nonatomic, retain) UIView *blackView;
@property (nonatomic, retain) UINavigationController *testController;
@property (nonatomic, retain) IBOutlet UILabel *currentUser;
@property (nonatomic, retain) IBOutlet UILabel *restaurtantNameLabel;

- (IBAction) actionToNext:(id)sender;
- (IBAction) showPadOrderInformation:(id)sender;
- (IBAction) hidePadOrderInformation:(id)sender;
@end
