//
//  CustomCell.m
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "SocialItemCell.h"

@implementation SocialItemCell

//-(id) initWithSocialItem:(SocialItem*)socialItem {
//    
//    self = [super init];
//    if (self) {
//        _socialItem = socialItem;
//    }
//    return self;
//    
//}


-(void)layoutSubviews {
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
}

@end
