//
//  Dish.m
//  padOrder
//
//  Created by Macric Cho on 2010/9/26.
//  Copyright 2010 Macricho. All rights reserved.
//

#import "EntityDish.h"
#import "EntityImage.h"

@implementation EntityDish
@dynamic Dish_Name;
@dynamic Dish_No;
@dynamic Update_Date;
@dynamic Describe;
@dynamic Dish_Price;
@dynamic DishSet;
@dynamic Kind;
@dynamic Images;
@dynamic isSuggest;
@dynamic Type;
@dynamic willShow;

- (EntityImage *)imageEntityForMainImage{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.Dish = %@",self];
    NSArray *predicateResultArray = [self.Images filteredArrayUsingPredicate:predicate];
    EntityImage *image = [predicateResultArray lastObject];
    return image;
}

- (NSURL *)getURLForMainImageFullPath{
    EntityImage *image = [self imageEntityForMainImage];
    NSURL *url = [[self getApplicationDelegate] applicationDocumentsDirectory];
    url = [url URLByAppendingPathComponent:image.Image_Path];
    url = [url URLByAppendingPathComponent:image.Image_FileName];
    return url;
}

- (UIImage *) imageForMainImageWithClip:(BOOL)useClip{
    NSURL *picPath = [self getURLForMainImageFullPath];
    //[UIImage im] 
    //picPath = [NSURL URLWithString:@"http://padorder.appspot.com/dimages/0.png"];
    UIImage *showPicture = [UIImage imageWithContentsOfFile:[picPath path]];
    
    if (showPicture == nil) {
        showPicture = [UIImage imageNamed:@"no_image.gif"];
    }
    else if(useClip){
        CGRect clip = CGRectMake(showPicture.size.width*0.25, showPicture.size.height*0.25, 200, 200);
        showPicture = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(showPicture.CGImage , clip)];
    }

    return showPicture;
}

- (UIImage *)cuttedMainImageWithSize:(CGSize)size{
    return nil;
}

@end
