//
//  SaveUseViewController.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/27.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SaveUseViewController : UIViewController {
    UITextField *idTextField;
    UITextField *passwordTextField;
    UILabel *warningTextLabel;
    UITableView *tableView;
    UIView *waittingView;
    UIView *succesLoginView;
    UIButton *loginButton;
    UIButton *passButton;
    UIButton *useButton;
}

@property (nonatomic, retain) IBOutlet UITextField *idTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;
@property (nonatomic, retain) IBOutlet UILabel *warningTextLabel;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIView *waittingView;
@property (nonatomic, retain) IBOutlet UIView *succesLoginView;
@property (nonatomic, retain) IBOutlet UIButton *loginButton;
@property (nonatomic, retain) IBOutlet UIButton *passButton;
@property (nonatomic, retain) IBOutlet UIButton *useButton;
@end
