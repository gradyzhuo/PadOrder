//
//  MemberViewController.h
//  padOrder
//
//  Created by Macric Cho on 2010/9/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRViewController.h"
#import "FBConnect.h"
#import "MemberDataTableViewController.h"
#import "MemberSaveModelController.h"

@interface MemberViewController : SRViewController<UITextFieldDelegate,UIScrollViewDelegate>{
    BOOL isLoginState;
    UITextField *account;
    UITextField *password;
    CGPoint loginScrollViewCenter;
    CGPoint saveTableViewCenterHidden;
    CGPoint saveTableViewCenterShown;
    MemberDataTableViewController *tableViewController;
    MemberSaveModelController *memberSaveModelController;
    UIScrollView *contentScrollView;
}

@property (nonatomic, retain) IBOutlet UITextField *account;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL isLoginState;
@property (nonatomic, retain) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, retain) MemberSaveModelController *memberSaveModelController;
@property (nonatomic, retain) MemberDataTableViewController *tableViewController;
- (IBAction) login:(id)sender;
- (IBAction) logout:(id)sender;
- (IBAction) clear:(id)sender;

- (void) loginSuccessAction:(id)sender;
- (IBAction) nextPasswordField:(id)sender;


@end
