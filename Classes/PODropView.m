//
//  PODropView.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/24.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "PODropView.h"
#import "DishTableCellView.h"

@implementation PODropView
@synthesize dishNameLabel;
@synthesize orderCount;
@synthesize dishOrderCountLabel;

- (id) initWithImage:(UIImage *)image andCellView:(DishTableCellView *)cellView{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] initWithImage:image];
        _cellView = cellView;
        //self.frame = _imageView.frame;
        _imageView.frame = CGRectMake(0, 0, 200, 200);
        
        self.orderCount = 1;
        
        dishNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)] autorelease];
        dishOrderCountLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 100)] autorelease];
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [closeButton addTarget:self action:@selector(closeImageView:) forControlEvents:UIControlEventTouchUpInside];
        [addButton addTarget:self action:@selector(addCount:) forControlEvents:UIControlEventTouchUpInside];
        [subButton addTarget:self action:@selector(subCount:) forControlEvents:UIControlEventTouchUpInside];
        
        [closeButton setImage:[UIImage imageNamed:@"closebox.png"] forState:UIControlStateNormal];
        [closeButton setImage:[UIImage imageNamed:@"closebox_pressed.png"] forState:UIControlStateNormal];
        
        [addButton setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        [subButton setImage:[UIImage imageNamed:@"sub.png"] forState:UIControlStateNormal];
        
        addButton.frame = CGRectMake(0, 0, 50, 50);
        subButton.frame = CGRectMake(0, 0, 50, 50);
        closeButton.frame = CGRectMake(0, 0, 45, 55);
        
        dishOrderCountLabel.center = CGPointMake(100, 100);
        buttonView.center = CGPointMake(100, 180);
        addButton.center = CGPointMake(50,170);
        subButton.center = CGPointMake(150,170);
        closeButton.center = CGPointMake(180, 20);
        
        dishOrderCountLabel.layer.cornerRadius = 20;
        dishOrderCountLabel.layer.masksToBounds = YES;
        dishOrderCountLabel.layer.borderColor = [[UIColor blackColor] CGColor];
        dishOrderCountLabel.layer.borderWidth = 2;
        
        dishOrderCountLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        dishNameLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        buttonView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        
        dishOrderCountLabel.text = @"1份";
        dishOrderCountLabel.font = [UIFont fontWithName:dishOrderCountLabel.font.fontName size:40];
        dishOrderCountLabel.textAlignment = UITextAlignmentCenter;
        
        
        [self addSubview:_imageView];
        [self addSubview:dishNameLabel];
        [self addSubview:closeButton];
        [self addSubview:buttonView];
        [self addSubview:addButton];
        [self addSubview:subButton];
        [self addSubview:dishOrderCountLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

- (void) addCount:(id)sender{
    self.orderCount ++;
    dishOrderCountLabel.text = [NSString stringWithFormat:@"%d份",orderCount];
}

- (void) subCount:(id)sender{
    self.orderCount --;
    if (self.orderCount > 0) {
        dishOrderCountLabel.text = [NSString stringWithFormat:@"%d份",orderCount];
    }
    else{
        [self closeImageView:nil];
    }
    
}

- (void) closeImageView:(id)sender{
    _cellView.dataTableViewController.tableView.scrollEnabled = YES;
    [_cellView removeTipView];
    [self removeFromSuperview];
    [self release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_cellView touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [_cellView touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_cellView touchesEnded:touches withEvent:event];
}

@end
