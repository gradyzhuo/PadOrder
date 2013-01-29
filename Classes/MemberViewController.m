    //
//  MemberViewController.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MemberViewController.h"
#import "MemberModelController.h"
#import "EntityMember.h"

@implementation MemberViewController
@synthesize account;
@synthesize password;
@synthesize tableView;
@synthesize isLoginState;
@synthesize memberSaveModelController;
@synthesize tableViewController;
@synthesize contentScrollView;

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.memberSaveModelController = [[MemberSaveModelController alloc] init];
    
    self.tableViewController = [[MemberDataTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    //tableViewController.tableView = self.tableView;
    self.tableView.delegate = tableViewController;
    self.tableView.dataSource = tableViewController;
    saveTableViewCenterShown = self.tableView.center;
    saveTableViewCenterHidden = CGPointMake((self.tableView.center.x+self.tableView.bounds.size.width), self.tableView.center.y);
    self.tableView.center = saveTableViewCenterHidden;
    
    
}

- (IBAction) nextPasswordField:(id)sender{
    [self.password becomeFirstResponder];
}

- (void)loginSuccessAction:(id)sender{
    [[self.view viewWithTag:1919] setHidden:YES];
    [[self.view viewWithTag:1920] setHidden:NO];
    //UIView *bgScrollView = [self.view viewWithTag:1902];
    UIView *scrollView = [self.view viewWithTag:1910];
    
    //saveTableViewCenter = self.tableView.center;
    
    loginScrollViewCenter = scrollView.center;
    
    [self.password endEditing:YES];
    
    [UIView beginAnimations:@"LoginSuccess" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    
    scrollView.center = CGPointMake((0-scrollView.frame.size.width), scrollView.center.y);
    self.tableView.center = saveTableViewCenterShown;
    [UIView commitAnimations];
    self.isLoginState = YES;
    [self clear:nil];

}


- (IBAction) login:(id)sender{
    NSString *memberID = self.account.text;
    NSString *memberPassword = self.password.text;
    
    MemberModelController *memberModelController = [[MemberModelController alloc] init];
    EntityMember *member = [memberModelController loginMemberID:memberID andPassword:memberPassword];
    if(member){
        [self.applicationDelegate.standardUserDefaults setObject:member.Member_Name forKey:@"MEMBER_NAME"];
        [self.applicationDelegate.standardUserDefaults setBool:YES forKey:@"MEMBER_LOGIN"];
        [self.applicationDelegate.standardUserDefaults setObject:memberID forKey:@"MEMBER_ID"];
        [self.applicationDelegate.standardUserDefaults synchronize];
        self.tableViewController.fetchedResultsController = [self.memberSaveModelController fetchedSaveResultsControllerWithID:memberID];
        [self.tableView reloadData];
        [self loginSuccessAction:sender];
    }
    else{
        [[self.view viewWithTag:1919] setHidden:NO];
        [[self.view viewWithTag:1920] setHidden:YES];
    }
    [memberModelController release];
}

- (void)logout:(id)sender{
    [self.applicationDelegate.standardUserDefaults setBool:NO forKey:@"MEMBER_LOGIN"];
    [self.applicationDelegate.standardUserDefaults setObject:@"" forKey:@"MEMBER_ID"];
    [self.applicationDelegate.standardUserDefaults setObject:@"" forKey:@"MEMBER_NAME"];
    [self.applicationDelegate.standardUserDefaults synchronize];
    UIView *scrollView = [self.view viewWithTag:1910];
    [UIView beginAnimations:@"Logout" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    
    self.tableView.center = saveTableViewCenterHidden;
    scrollView.center = loginScrollViewCenter;
    
    [UIView commitAnimations];
    [[self.view viewWithTag:1920] setHidden:YES];
    self.isLoginState = NO;
    
}

- (void)clear:(id)sender{
    self.account.text = nil;
    self.password.text = nil;
    
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale{
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    UIScrollView *bgScrollView = [self.view viewWithTag:1902];
    bgScrollView.contentScaleFactor = 5;
    bgScrollView.scrollEnabled = YES;
    bgScrollView.zoomScale = 2.0;
    [bgScrollView setMaximumZoomScale:20.0];
    [bgScrollView zoomToRect:textField.frame animated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


-(void)loadView{
    [super loadView];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
