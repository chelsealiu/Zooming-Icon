//
//  ViewController.h
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"

@interface DetailViewController : UIViewController <UINavigationControllerDelegate>


@property (retain, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) SocialItem *detailItem;

@end

