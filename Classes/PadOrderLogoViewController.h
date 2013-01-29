//
//  PadOrderLogoViewController.h
//  padOrder
//
//  Created by Grady Cho on 11/3/11.
//  Copyright 2011年 Macricho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSViewController.h"
#import "POThirdImporter.h"

@interface PadOrderLogoViewController : FSViewController<ASICacheDelegate,ASIHTTPRequestDelegate,ASIProgressDelegate> {
    ASIHTTPRequest *httpRequest;
}

@property (nonatomic, retain) ASIHTTPRequest *httpRequest;
@property (nonatomic, retain) IBOutlet UIButton *exitButton;

- (IBAction) hideInfoView:(id)sender;
- (void) createInfoLabelHeight:(UILabel *)label;
- (void) scrollViewContentSizeAdder:(UIScrollView *)theScrollView;
- (NSString *)infomationTextFromPlist:(NSString *)plistName;
- (IBAction) refreshDishImages:(id)sender;
@end
