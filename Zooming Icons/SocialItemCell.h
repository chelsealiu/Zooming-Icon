//
//  CustomCell.h
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"

@interface SocialItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *colourView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
-(void)layoutSubviews;
@property (strong, nonatomic) SocialItem *socialItem;


-(id) initWithSocialItem:(SocialItem*)socialItem;


@end
