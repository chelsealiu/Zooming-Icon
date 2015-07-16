//
//  SocialItem.h
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SocialItem : NSObject

@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *itemSummary;
@property (strong, nonatomic) UIColor *iconColour;

-(id) initWithName: (NSString*)itemName summary:(NSString*)itemSummary imageString:(NSString*)imageName andColour:(UIColor*)iconColour;

@end
