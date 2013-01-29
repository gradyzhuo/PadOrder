//
//  DishTableCellView.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/18.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "DishTableCellView.h"
#import "SRViewController.h"

@implementation DishTableCellView
@synthesize dishTitle;
@synthesize descriptText;
@synthesize dishImageName;
@synthesize dataTableViewController;
@synthesize dishPrice;
@synthesize buttonBgPicName;
@synthesize hotValue;
@synthesize detailButtonBgPicName;
@synthesize isExistDishImage;
@synthesize specifyShowText;
@synthesize dishOrderCountLabel;
@synthesize orderCount;
@synthesize dishImage_noshadow;
@synthesize dishNameLabel;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //self.frame = CGRectMake(0, 0, 650, 200);
        //NSLog(@"SET FRAME");
        //NSLog(@"ASSIGNSETUP");
        [self assignSetup];
    }
    return self;
}

-(void) setDishImage:(UIImage *)image{
    
    CGFloat pSize = self.imageView.frame.size.width/image.size.width;
    CGFloat imgHeight = image.size.height * pSize;
    
    CGRect frame = CGRectMake(0, 0, self.imageView.frame.size.width, imgHeight);
    
    [self setImage: image inFrame:frame];
}

- (void) setDishPrice:(NSNumber *)price{
    [self setDishPrice:price andFontSize:20];
}

-(void) setDishImageName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat pSize = self.imageView.frame.size.width/image.size.width;
    CGFloat imgHeight = image.size.height * pSize;
    
    CGRect frame = CGRectMake(0, 0, self.imageView.frame.size.width, imgHeight);
    
    [self setImage: image inFrame:frame];
    [image release];
}

- (void) setDescriptText:(NSString *)description{
    [self setDescription:description andFontSize:14 withColor:[UIColor darkGrayColor]];
}

- (void) setDishTitle:(NSString *)title{
    [self setDishTitle:title andFontSize:30];
}

- (void) setHotValue:(NSInteger)value{
	self.hotSplider.value = value;
}

- (void) setButtonBgPicName:(NSString *)name{
    [self setSubmitButton: name withShadow:NO];
    self.submitButton.isDetail = NO;
    [self.submitButton setTitle:@"加點" forState:UIControlStateNormal];
    [self.submitButton addTarget:self.dataTableViewController action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDetailButtonBgPicName:(NSString *)name{
    [self setDetailButton: name withShadow:NO];
	self.detailButton.isDetail = NO;
    [self.detailButton setTitle:@"介紹" forState:UIControlStateNormal];
    [self.detailButton addTarget:self.dataTableViewController action:@selector(buttonDetail:) forControlEvents:UIControlEventTouchUpInside];
     
}

- (void)setSpecifyShowText:(NSString *)text{
    self.crownImageView.hidden = NO;
    [self setCrownLabelText:text andFontSize:30 andOffset:CGSizeMake(-10, -5)];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"Began");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch previousLocationInView:self.applicationDelegate.mainSplitViewController.view];
    PODropView *cellShotImageView = nil;
    
    if ((cellShotImageView = (UIImageView *)[self.applicationDelegate.mainSplitViewController.view viewWithTag:900])) {
        
        UIViewController *leftViewController = [self.applicationDelegate.mainSplitViewController.viewControllers objectAtIndex:0];
        UIView *tipView = [self.applicationDelegate.mainSplitViewController.view viewWithTag:5200];
        UILabel *tipLabel = (UILabel *)[tipView viewWithTag:5201];
        
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];

        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight ) {
            
            tipLabel.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, 45);
            tipView.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, leftViewController.view.frame.size.height);
            
        }else if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
            
            tipLabel.frame = CGRectMake(0, 0, 400, 45);
            tipView.frame = CGRectMake(0, 0, 400, 120);
        }
        
        cellShotImageView.center = touchPoint;
        //cellShotImageView.frame = CGRectMake(cellShotImageView.frame.origin.x, cellShotImageView.frame.origin.y, 200, 200);
        //cellShotImageView.frame = CGRectMake(touchPoint.x, touchPoint.y, cellSize.width, cellSize.height);
        self.dataTableViewController.tableView.scrollEnabled = NO;

    }
    else{
        
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        UIViewController *leftViewController = [self.applicationDelegate.mainSplitViewController.viewControllers objectAtIndex:0];
        //UIViewController *righViewController = [self.applicationDelegate.mainSplitViewController.viewControllers objectAtIndex:1];
        
        CGRect splitFrame = self.applicationDelegate.mainSplitViewController.view.frame;
        UIView *blockView = [[UIView alloc] init];
        blockView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        blockView.tag = 5203;
        blockView.autoresizingMask = UIViewAutoresizingNone;
        blockView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.text = @"請拖曳至此加點餐點";
        tipLabel.textAlignment = UITextAlignmentCenter;
        tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:35];
        tipLabel.tag = 5201;
        UIView *tipView = [[UIView alloc] init];
        tipView.tag = 5200;
        tipView.autoresizingMask = UIViewAutoresizingNone;
        tipView.layer.cornerRadius = 10;
        tipView.layer.masksToBounds = YES;
        tipView.layer.borderWidth = 2;
        tipView.layer.borderColor = [[UIColor blackColor] CGColor];
        tipView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
        [tipView addSubview:tipLabel];
        
        
        
        if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight )) {
            tipLabel.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, 45);
            tipView.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, leftViewController.view.frame.size.height);
            blockView.frame = CGRectMake(0, 0, splitFrame.size.height, splitFrame.size.width);
        }else if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ){
            tipLabel.frame = CGRectMake(0, 0, 400, 45);
            tipView.frame = CGRectMake(0, 0, 400, 120);
            blockView.frame = CGRectMake(0, 0, splitFrame.size.width, splitFrame.size.height);
        }
        
        
        //self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        UIImage *cellImage = [self.dishEntityInfo imageForMainImageWithClip:NO];
        //UIImage *cellImage = [POAnimationController screenshotWithView:self];
        //self.backgroundColor = [UIColor clearColor];
        
        cellShotImageView = [[PODropView alloc] initWithImage:cellImage andCellView:self];
        cellShotImageView.layer.cornerRadius = 20;
        cellShotImageView.layer.borderWidth = 4;
        cellShotImageView.layer.borderColor = [[UIColor brownColor] CGColor];
        cellShotImageView.layer.masksToBounds = YES;
        
        cellShotImageView.dishNameLabel.text = [NSString stringWithFormat:@" ➣%@",self.dishEntityInfo.Dish_Name];
        
        
        cellShotImageView.tag = 900;
        CGSize cellSize = CGSizeMake(200, 200);//cellShotImageView.frame.size;
        //cellShotImageView.frame = CGRectMake(touchPoint.x, touchPoint.y, cellSize.width, cellSize.height);
        
        cellShotImageView.frame = CGRectMake(0, 0, 200, 200);
        cellShotImageView.center = touchPoint;
        [self.applicationDelegate.mainSplitViewController.view addSubview:blockView];
        [self.applicationDelegate.mainSplitViewController.view addSubview:cellShotImageView];
        [self.applicationDelegate.mainSplitViewController.view addSubview:tipView];
        
        
        
        //[UIView beginAnimations:@"IMAGE" context:nil];
        //[UIView setAnimationDuration:0.5];
        
        //cellShotImageView.frame = CGRectMake(touchPoint.x, touchPoint.y, 200, 200);
        
        //[UIView beginAnimations:@"ChangeImage" context:nil];
        //[UIView setAnimationDuration:0.5];
        //cellShotImageView.image = [self.dishImageButton imageForState:UIControlStateNormal];
        //cellShotImageView.alpha = 0;
        
        //[UIView commitAnimations];
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"Move");
    
    self.dataTableViewController.tableView.scrollEnabled = NO;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch previousLocationInView:self.applicationDelegate.mainSplitViewController.view];
    
    UIViewController *leftViewController = [self.applicationDelegate.mainSplitViewController.viewControllers objectAtIndex:0];
    
    //NSLog(@"x:%f width:%f",touchPoint.x,leftViewController.view.frame.size.width);
    
    
    PODropView *cellShotImageView = [self.applicationDelegate.mainSplitViewController.view viewWithTag:900]; 
    
    [NSObject cancelPreviousPerformRequestsWithTarget:cellShotImageView selector:@selector(removeFromSuperview) object:nil];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeView:) object:cellShotImageView];
    [NSObject cancelPreviousPerformRequestsWithTarget:cellShotImageView selector:@selector(release) object:nil];
    
    CGSize cellSize = cellShotImageView.frame.size;
    cellShotImageView.center = touchPoint;
    //cellShotImageView.frame = CGRectMake(touchPoint.x, touchPoint.y, cellSize.width, cellSize.height);
    
    
    UIView *tipView = [self.applicationDelegate.mainSplitViewController.view viewWithTag:5200];
    UILabel *tipLabel = (UILabel *)[tipView viewWithTag:5201];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight ) {
        
        tipLabel.text = @"請拖曳至此加點餐點";
        tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:35];
        tipLabel.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, 45);
        tipView.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, leftViewController.view.frame.size.height);
        
        if (touchPoint.x < leftViewController.view.frame.size.width) {
            tipView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
            tipLabel.text = [NSString stringWithFormat:@"%@\n即將加點%@",self.dishEntityInfo.Dish_Name,cellShotImageView.dishOrderCountLabel.text];
            tipLabel.numberOfLines = 2;
            tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:25];
            tipLabel.frame = CGRectMake(0, 0, leftViewController.view.frame.size.width, 70);
        }
        
    }else if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        
        tipLabel.text = @"請拖曳至此加點餐點";
        tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:35];
        tipLabel.frame = CGRectMake(0, 0, 400, 45);
        tipView.frame = CGRectMake(0, 0, 400, 120);
        if (touchPoint.x <= 400 && touchPoint.y <= 120) {
            tipView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
            tipLabel.text = [NSString stringWithFormat:@"%@\n即將加點%@",self.dishEntityInfo.Dish_Name,cellShotImageView.dishOrderCountLabel.text];
            tipLabel.numberOfLines = 2;
            tipLabel.frame = CGRectMake(0, 0, 400, 70);
            tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:25];
        }
        
    }
    else{
        tipLabel.text = @"請拖曳至此加點餐點";
        tipLabel.frame = CGRectMake(0, 0, tipLabel.frame.size.width, 45);
        tipLabel.numberOfLines = 1;
        tipView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
        tipLabel.font = [UIFont fontWithName:tipLabel.font.fontName size:35];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"End");
    UIButton *orderedButton = [self.dataTableViewController.menuViewController.view viewWithTag:9001];
    self.dataTableViewController.tableView.scrollEnabled = NO;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch previousLocationInView:self.applicationDelegate.mainSplitViewController.view];

    UIViewController *leftViewController = [self.applicationDelegate.mainSplitViewController.viewControllers objectAtIndex:0];

    PODropView *cellShotImageView = (PODropView *)[self.applicationDelegate.mainSplitViewController.view viewWithTag:900];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight ) && touchPoint.x < leftViewController.view.frame.size.width) {
        cellShotImageView.alpha = 0;
        [self.dataTableViewController addOrderDish:self.dishEntityInfo withOrderedListAnimation:YES count:cellShotImageView.orderCount];
        [cellShotImageView closeImageView:nil];
        [self removeTipView];
        
    }else if((interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) && touchPoint.x <= 400 && touchPoint.y <= 120){
        [self.dataTableViewController flashButton:orderedButton];
        [self.dataTableViewController addOrderDish:self.dishEntityInfo withOrderedListAnimation:YES count:cellShotImageView.orderCount];
        cellShotImageView.alpha = 0;
        [cellShotImageView closeImageView:nil];
        [self removeTipView];
        //NSLog(@"PORTRAIT");
    }
    else{
        //[self performSelector:@selector(removeView:) withObject:cellShotImageView afterDelay:1];
    }
}

- (void)removeTipView{
    [[self.applicationDelegate.mainSplitViewController.view viewWithTag:5203] removeFromSuperview];
    [[self.applicationDelegate.mainSplitViewController.view viewWithTag:5200] removeFromSuperview];
}

- (void) removeView:(UIView *)view{
    view.alpha = 1;
    [UIView beginAnimations:@"RemoveViewAnimation" context:nil];
    [UIView setAnimationDuration:1];
    view.alpha = 0;
    [UIView commitAnimations];
    
    [view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1];
    //[view performSelector:@selector(release) withObject:nil afterDelay:1.5];
    //[self performSelector:@selector(tableViewEnableScroll) withObject:nil afterDelay:1];
    self.dataTableViewController.tableView.scrollEnabled = YES;
}

- (void) tableViewEnableScroll{
    self.dataTableViewController.tableView.scrollEnabled = YES;
}

@end
