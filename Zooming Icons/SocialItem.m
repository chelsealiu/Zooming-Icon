//
//  SocialItem.m
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "SocialItem.h"

@implementation SocialItem

-(id) initWithName: (NSString*)itemName summary:(NSString*)itemSummary imageString:(NSString*)imageName andColour:(UIColor*)iconColour {
    
    if (self = [super init]) {
        _itemName = itemName;
        _itemSummary = itemSummary;
        _imageName = imageName;
        _iconColour = iconColour;
    }
    
    return self;
}

@end
