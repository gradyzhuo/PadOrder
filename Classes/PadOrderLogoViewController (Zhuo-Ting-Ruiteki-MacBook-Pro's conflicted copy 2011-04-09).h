//
//  PadOrderLogoViewController.h
//  padOrder
//
//  Created by Grady Cho on 11/3/11.
//  Copyright 2011年 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "padOrderViewController.h"
//#import "POInfoDictionary.h"

@interface PadOrderLogoViewController : padOrderViewController {
    UILabel *informationLabel;
    UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIButton *exitButton;
@property (nonatomic, retain) IBOutlet UILabel *informationLabel;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (IBAction) hideInfoView:(id)sender;
- (void) createInfoLabelHeight:(UILabel *)label;
- (void) scrollViewContentSizeAdder:(UIScrollView *)theScrollView;
- (NSString *) infomationTextFromPlist:(NSString *)plistName;
@end
