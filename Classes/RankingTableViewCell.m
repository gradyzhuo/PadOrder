//
//  RankingTableViewCell.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingTableViewCell.h"


@implementation RankingTableViewCell
@synthesize titleLabel;
@synthesize imageView;
@synthesize textView;
@synthesize levelLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 37)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        self.imageView.layer.cornerRadius = 100;
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.borderColor = [[UIColor brownColor] CGColor];
        self.imageView.layer.borderWidth = 2.5;
        //self.imageView.clipsToBounds = NO;
        
        
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        levelLabel.center = CGPointMake(self.imageView.center.x, self.imageView.center.y-165);
        levelLabel.layer.cornerRadius = 100;
        levelLabel.layer.masksToBounds = YES;
        levelLabel.text = @"\n\n\n\n\n\n\n";
        levelLabel.textColor = [UIColor whiteColor];
        levelLabel.font = [UIFont fontWithName:levelLabel.font.fontName size:20];
        levelLabel.numberOfLines = 8;
        levelLabel.textAlignment = UITextAlignmentCenter;
        levelLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self.imageView addSubview:levelLabel];
        //self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 400, 128)];
        self.textView.editable = NO;
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.userInteractionEnabled = NO;
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.textView];
        [self addSubview:self.imageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
