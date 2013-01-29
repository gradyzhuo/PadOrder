//
//  RankingLeftTableViewCell.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingLeftTableViewCell.h"


@implementation RankingLeftTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.imageView.center = CGPointMake(100, 100);
        self.titleLabel.textAlignment = UITextAlignmentLeft;
        self.titleLabel.center = CGPointMake(418, 32);
        self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.fontName size:50];
        self.textView.center = CGPointMake(418, 124);
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
