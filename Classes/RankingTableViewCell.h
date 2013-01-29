//
//  RankingTableViewCell.h
//  PadOrder
//
//  Created by Zhuo Ting-Rui on 2011/4/25.
//  Copyright 2011年 GradyCho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RankingTableViewCell : UITableViewCell {
    UIImageView *imageView;
    UITextView *textView;
    UILabel *titleLabel;
    UILabel *levelLabel;
}
@property (nonatomic, retain) UILabel *levelLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, retain) UILabel *titleLabel;

@end
