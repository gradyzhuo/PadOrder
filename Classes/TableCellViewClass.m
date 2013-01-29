//
//  TableCellViewClass.m
//  padOrder
//
//  Created by Macric Cho on 2010/10/18.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "TableCellViewClass.h"

@implementation TableCellViewClass
@synthesize dishImage;
@synthesize dishImageView;
@synthesize submitButton;
@synthesize titleLabel;
@synthesize descriptTextView;
@synthesize priceLabel;
@synthesize hotSplider;
@synthesize detailButton;
@synthesize shareLabel;
@synthesize applicationDelegate;
@synthesize crownImageView;
@synthesize crownLabel;
@synthesize dishImageButton;
@synthesize dishEntityInfo;

#pragma mark -
#pragma mark self method

- (CGFloat) pointFromRightSide:(CGFloat) width{
    return self.frame.size.width - width;
}

- (CGFloat) pointFromButtomSide:(CGFloat) height{
    return self.frame.size.height - height;
}

- (void) assignSetup{
    //self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //self.frame =  CGRectMake(0, 0, 650, 200);
    //加入背景覆蓋，讓cell被點選的時候，看不到藍色的Highlight狀態
    //取消，因為可以再需要點選的時候，短暫的允許再關掉，不然會不能跳到最上面
    //UITextView *bgCover = [[UITextView alloc] initWithFrame:self.frame];
    //bgCover.backgroundColor = [UIColor clearColor];
    //bgCover.editable = NO;
    //[self addSubview:bgCover];
    //加入按鈕
    self.submitButton = [VarsButton buttonWithType:UIButtonTypeCustom];
    self.submitButton.autoresizingMask = UIViewAutoresizingFlexibleWidth+UIViewAutoresizingFlexibleLeftMargin;
    self.submitButton.frame = CGRectMake(540, 45, 0, 0);
    //[self addSubview:self.submitButton];
    
    self.detailButton = [VarsButton buttonWithType:UIButtonTypeCustom];
    self.detailButton.autoresizingMask = UIViewAutoresizingFlexibleWidth+UIViewAutoresizingFlexibleLeftMargin;
    self.detailButton.frame = CGRectMake(540, 105, 0, 0);
    //[self addSubview:self.detailButton];
    
    //加入圖片的視圖，但還不含圖片
    //self.dishImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //self.dishImageView.layer.cornerRadius = 10;
    //self.dishImageView.layer.masksToBounds = YES;
    
    dishImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dishImageButton.frame = CGRectMake(0, 0, 200, 200);
    [dishImageButton addTarget:self action:@selector(moreDishImage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dishImageButton];
    //[self addSubview:self.dishImageView];
    
    //加入皇冠的圖片及標籤，但先不顯示
    UIImage * crownImage = [UIImage imageNamed:@"crown.png"];
    self.crownImageView = [[UIImageView alloc] initWithImage:crownImage];

    self.crownLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 0, 0)];
    self.crownLabel.font = [UIFont fontWithName:self.crownLabel.font.fontName size:20];
    //self.crownLabel.text = @"主廚推薦";
    //self.crownLabel.textColor = [UIColor brownColor];
    self.crownLabel.shadowColor = [UIColor grayColor];
    self.crownLabel.shadowOffset = CGSizeMake(2, 1);
    self.crownLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    self.crownLabel.textAlignment = UITextAlignmentCenter;
    [self.crownImageView addSubview:self.crownLabel];
    
    self.crownImageView.frame = CGRectMake(-10, -5, 90, 75);
    self.crownImageView.transform = CGAffineTransformMakeRotation(-0.5);
    self.crownImageView.hidden = YES;
    [self addSubview:self.crownImageView];
    
    CGRect imagrFrame = self.dishImageButton.frame;
    CGFloat imgOffset = imagrFrame.size.width + imagrFrame.origin.x;
    //self.dishImageView.frame.size.width + self.dishImageView.frame.origin.x;
    //imgOffset += 10;
    //
    //設定社交網的標籤
    self.shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+imgOffset, 10, 80, 20)];
    self.shareLabel.backgroundColor = [UIColor clearColor];
    self.shareLabel.text = @"分享至： ";
    [self addSubview:self.shareLabel];
    
    //
    //設定社交網的圖片
    CGFloat xLabel = self.shareLabel.frame.origin.x;
    CGFloat yLabel = self.shareLabel.frame.origin.y-5;
    CGFloat widthLabel = self.shareLabel.frame.size.width;
    //CGFloat heightLabel = self.shareLabel.frame.size.height;
    
    CGFloat xOffset = xLabel+widthLabel;
    
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeCustom];
    facebook.tag = 0;
    [facebook setImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(shareToSocial:) forControlEvents:UIControlEventTouchUpInside];
    facebook.frame = CGRectMake(xOffset, yLabel, 30, 30);
    [self addSubview:facebook];
    
    
    //Plurk
    //API KEY : EhrvEWxzbiOpknhGivDmea0KcR3qUR1K
    xLabel = xOffset;
    yLabel = yLabel;
    CGFloat widthButton = 30;
    //CGFloat heightLabel = self.shareLabel.frame.size.height;
    
    xOffset = xLabel+widthButton+10;
    
    UIButton *plurk = [UIButton buttonWithType:UIButtonTypeCustom];
    
    plurk.tag = 1;
    [plurk setImage:[UIImage imageNamed:@"plurk.png"] forState:UIControlStateNormal];
    [plurk addTarget:self action:@selector(shareToSocial:) forControlEvents:UIControlEventTouchUpInside];
    plurk.frame = CGRectMake(xOffset, yLabel, 30, 30);
    [self addSubview:plurk];
    
    //Twitter
    
    xLabel = xOffset;
    yLabel = yLabel;
    //CGFloat heightLabel = self.shareLabel.frame.size.height;
    
    xOffset = xLabel+30+10;
    
    UIButton *twitter = [UIButton buttonWithType:UIButtonTypeCustom];
    twitter.tag = 1;
    [twitter setImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    [twitter addTarget:self action:@selector(shareToSocial:) forControlEvents:UIControlEventTouchUpInside];
    twitter.frame = CGRectMake(xOffset, yLabel, 30, 30);
    [self addSubview:twitter];
    
    
    
    
    
    
    //
    //設定標題標籤
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+imgOffset, 40, 0, 0)];
    [self addSubview:self.titleLabel];
    
    //
    //設定價錢標籤
    CGFloat xPoint = self.dishImageView.frame.origin.x + 100;
    CGFloat yPoint = self.dishImageView.frame.origin.y + (190*5/6);
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(xPoint, yPoint, 90, (200/6))];
    self.priceLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    self.priceLabel.shadowColor = [UIColor grayColor];
    self.priceLabel.shadowOffset = CGSizeMake(1, 1);
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.textAlignment = UITextAlignmentCenter;
    //self.priceLabel.text = @"NT $ 100";
    [self addSubview:self.priceLabel];
    
    //加入描述的文字視圖區
    CGPoint point = self.titleLabel.frame.origin;
    CGFloat width = self.submitButton.frame.origin.x - imgOffset - 50;
    self.descriptTextView = [[UITextView alloc] initWithFrame:CGRectMake(point.x-5, point.y+30, width, 200)];
	//self.descriptTextView.editable = YES;
    //descriptTextView.tracking = NO;
    [descriptTextView setUserInteractionEnabled:NO];
    [self addSubview:self.descriptTextView];
	
	self.hotSplider = [[UISlider alloc] init];
	[self addSubview:self.hotSplider];
    
}

- (void) setImage:(UIImage *)image inFrame:(CGRect)frame{
    UIImage *noImage = [UIImage imageNamed:@"no_image.png"];
    //self.dishImageView.image = image;
    [dishImageButton setImage:image forState:UIControlStateNormal];
    if (image.CGImage != noImage.CGImage) {
        //self.dishImageView.image = [self imageWithShadow:image];
        [dishImageButton setImage:[self imageWithShadow:image] forState:UIControlStateNormal];
    }
    
}

- (void) setSubmitButton:(NSString *)normalImageName withShadow:(BOOL)canUseShowdow{    
    UIImage *buttonImage = [UIImage imageNamed:normalImageName];
    if(canUseShowdow) buttonImage = [self imageWithShadow:buttonImage];
    //[self.submitButton setImage:buttonImage forState:UIControlStateNormal];
    //[self.submitButton setImage:[self imageWithShadow:[UIImage imageNamed:pressed]] forState:UIControlStateHighlighted];
    //CGFloat xAfterTitle = self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width;
    //CGFloat yEqualTitle = self.titleLabel.frame.origin.y;
    CGFloat buttonWidth = 100;//buttonImage.size.width;//self.submitButton.imageView.image.size.width;
    CGFloat buttonHeight = 50;//buttonImage.size.height;//self.submitButton.imageView.image.size.height;
    
    self.submitButton.frame = CGRectMake(self.submitButton.frame.origin.x, self.submitButton.frame.origin.y, buttonWidth , buttonHeight);
    
    self.submitButton.titleLabel.font = [UIFont fontWithName:self.submitButton.titleLabel.font.fontName size:25];
    
    [self.submitButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self addSubview:self.submitButton];
    
}

- (void) setDetailButton:(NSString *)normalImageName withShadow:(BOOL)canUseShowdow{    
    UIImage *buttonImage = [UIImage imageNamed:normalImageName];
    if(canUseShowdow) buttonImage = [self imageWithShadow:buttonImage];
    //[self.submitButton setImage:buttonImage forState:UIControlStateNormal];
    //[self.submitButton setImage:[self imageWithShadow:[UIImage imageNamed:pressed]] forState:UIControlStateHighlighted];
    //CGFloat xAfterTitle = self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width;
    //CGFloat yEqualTitle = self.titleLabel.frame.origin.y;
    CGFloat buttonWidth = 100;//buttonImage.size.width;//self.submitButton.imageView.image.size.width;
    CGFloat buttonHeight = 50;//buttonImage.size.height;//self.submitButton.imageView.image.size.height;
    
    self.detailButton.titleLabel.font = [UIFont fontWithName:self.detailButton.titleLabel.font.fontName size:25];
    self.detailButton.frame = CGRectMake(self.detailButton.frame.origin.x, self.detailButton.frame.origin.y, buttonWidth , buttonHeight);
    [self.detailButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self addSubview:self.detailButton];
}

- (void) label:(UILabel *)label withPoint:(CGPoint)point setText:(NSString *)text andFontSize:(CGFloat)size andOffset:(CGSize)offset{
    CGFloat strLen = text.length;
    //self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20+imgOffset, 20, strLen*(size)+1, size+5)]
    //label.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, strLen*(size)+1, size+5);
    label.frame = CGRectMake(point.x+offset.width, point.y+offset.height, strLen*(size)+1, size+5);
    label.shadowOffset = CGSizeMake(1, 1);
    label.shadowColor = [UIColor whiteColor];
    label.text = text;
    label.font = [UIFont systemFontOfSize:size];
    label.backgroundColor = [UIColor clearColor];
    
}


- (void) setDishTitle:(NSString *)title andFontSize:(CGFloat)size{
    CGPoint point = CGPointMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y);
    [self label:self.titleLabel withPoint:point setText:title andFontSize:size andOffset:CGSizeZero];
}

- (void)setCrownLabelText:(NSString *)text andFontSize:(CGFloat)size andOffset:(CGSize)offset{
    CGPoint point = CGPointMake(self.crownLabel.frame.origin.x, self.crownLabel.frame.origin.y);
    self.dishImageButton.frame = CGRectMake(20, 20, 180, 180);// = [[UIImageView alloc] initWithFrame:];
    
    CGFloat xPoint = self.dishImageButton.frame.origin.x + 80;
    CGFloat yPoint = self.dishImageButton.frame.origin.y + (165*5/6);
    self.priceLabel.frame = CGRectMake(xPoint, yPoint, 90, (200/6));
    //self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(xPoint, yPoint, 90, (200/6))];
    
    [self label:self.crownLabel withPoint:point setText:text andFontSize:size andOffset:offset];
}

//重新安排DishPrice的標籤吧
- (void) setDishPrice:(NSNumber *)price andFontSize:(CGFloat)size{
    //CGFloat xPoint = self.frame.size.width - 150;
    //CGPoint point = CGPointMake(xPoint, self.titleLabel.frame.origin.y);
    NSString *priceString = [NSString stringWithFormat:@"NT $%@",price];
    self.priceLabel.text = priceString;
    
    self.priceLabel.font =[UIFont fontWithName:@"Chalkduster" size:18];
}


- (void) setDescription:(NSString *)description andFontSize:(CGFloat)fontSize withColor:(UIColor *)color{
    self.descriptTextView.text = description;
    self.descriptTextView.font = [UIFont systemFontOfSize:fontSize];
    self.descriptTextView.editable = NO;
    self.descriptTextView.textColor = color;
    self.descriptTextView.backgroundColor = [UIColor clearColor];
}

#pragma mark -
#pragma mark TableViewCell init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        self.applicationDelegate = (padOrderAppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [super dealloc];
}


- (UIImage*)imageWithShadow : (UIImage *)image{
    CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceRGB();
	
	size_t bits = CGImageGetBitsPerComponent(image.CGImage);
	if( bits == 0 ) bits = 8;
    CGContextRef shadowContext = CGBitmapContextCreate(NULL, image.size.width + 10, image.size.height + 10, bits, 0, 
                                                       colourSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colourSpace);
    
    CGContextSetShadowWithColor(shadowContext, CGSizeMake(5, -5), 5, [UIColor blackColor].CGColor);
    CGContextDrawImage(shadowContext, CGRectMake(0, 10, image.size.width, image.size.height), image.CGImage);
    
    CGImageRef shadowedCGImage = CGBitmapContextCreateImage(shadowContext);
    CGContextRelease(shadowContext);
    
    UIImage * shadowedImage = [UIImage imageWithCGImage:shadowedCGImage];
    CGImageRelease(shadowedCGImage);
    
    return shadowedImage;
}

- (IBAction) shareToSocial:(id)sender{
    UIButton *socialButton = (UIButton *)sender;
    switch (socialButton.tag) {
        case 0:
        {
            //[self.applicationDelegate.fb authorize:nil delegate:self];
            NSArray *permissions =  [NSArray arrayWithObjects:@"read_stream",@"email", @"offline_access",nil];
            
            //NSLog(@"%@",self.applicationDelegate);
            
            if ([[UIApplication sharedApplication] isNetworkActivityIndicatorVisible]) {
                NSLog(@"YES");
            }
            else{
                NSLog(@"NO");
            }
            
            //NSLog(@"SESSION:%d",[self.applicationDelegate.fb isSessionValid]);
            //[self.applicationDelegate.fb ]
            //self.applicationDelegate.fb.sessionDelegate = self;
            //[self.applicationDelegate.fb authorize:permissions delegate:self];
            //[self.applicationDelegate.fb authorize:FB_PADORDER_ID permissions:permissions delegate:self];
            
            
            NSString *message = [NSString stringWithFormat:@"%@\n%@\n",self.titleLabel.text,self.descriptTextView.text];
            
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            //[params setObject:@"123871637691175" forKey:@"app_id"];
            [params setObject:self.applicationDelegate.fb_PadOrder_id forKey:@"app_id"];
            [params setObject:@"http://padorder.appspot.com" forKey:@"link"];
            [params setObject:[NSString stringWithFormat:@"http://padorder.appspot.com/dimages/%@",[[self.dishEntityInfo imageEntityForMainImage] Image_FileName]] forKey:@"picture"];
            [params setObject:self.titleLabel.text forKey:@"name"];
            [params setObject:[NSString stringWithFormat:@"%@",[self.applicationDelegate.standardUserDefaults objectForKey:@"Restaurant_Name"]] forKey:@"caption"];
            [params setObject:self.descriptTextView.text forKey:@"description"];
            //[params setObject:@"123871637691175" forKey:@"to"];
            [self.applicationDelegate.fb dialog:@"feed" andParams:params andDelegate:self];
            
        }
            break;
    }
}


- (void) moreDishImage:(id)sender{
    
    POMoreImageViewController *moreImageViewController = [[POMoreImageViewController alloc] initWithNibName:@"POMoreImageView" bundle:[NSBundle mainBundle]];
    //[moreImageViewController setWantsFullScreenLayout:YES];
    //UINavigationController *moreImageNavigationViewController = [[UINavigationController alloc] initWithRootViewController:moreImageViewController];
    
    [self.applicationDelegate sliderView:moreImageViewController.view beShow:YES];
}

#pragma mark -
#pragma mark FB Delegate

- (void)fbDialogLogin:(NSString *)token expirationDate:(NSDate *)expirationDate{
    
}

- (void)fbDialogNotLogin:(BOOL)cancelled{
    
}

- (void)fbDidNotLogin:(BOOL)cancelled{
    
}

- (void)fbDidLogout{
    
}

- (void)fbDidLogin{
    
}

- (void)dialogDidComplete:(FBDialog *)dialog{
    
    NSLog(@"%@",dialog);
}

@end
