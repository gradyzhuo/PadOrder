//
//  RankingRightTableViewCell.m
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/11.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import "RankingRightTableViewCell.h"


@implementation RankingRightTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.imageView.center = CGPointMake(579, 100);
        self.titleLabel.textAlignment = UITextAlignmentRight;
        self.titleLabel.center = CGPointMake(271, 32);
        self.textView.center = CGPointMake(271, 128);
        self.titleLabel.textAlignment = UITextAlignmentRight;
        //self.imageView.center = CGPointMake(self.frame.size.width-(self.imageView.frame.size.width/2), self.center.y);
        //self.backgroundColor = 
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
