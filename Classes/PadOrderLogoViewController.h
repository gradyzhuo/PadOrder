//
//  PadOrderLogoViewController.h
//  padOrder
//
//  Created by Grady Cho on 11/3/11.
//  Copyright 2011年 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "padOrderViewController.h"


@interface PadOrderLogoViewController : padOrderViewController {
    
}

@property (nonatomic, retain) IBOutlet UIButton *exitButton;

- (IBAction) hideInfoView:(id)sender;
- (void) createInfoLabelHeight:(UILabel *)label;
- (void) scrollViewContentSizeAdder:(UIScrollView *)theScrollView;
- (NSString *)infomationTextFromPlist:(NSString *)plistName;
@end
