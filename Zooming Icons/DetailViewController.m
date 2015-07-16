//
//  ViewController.m
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "DetailViewController.h"
#import "SocialItem.h"
#import "ZoomingIconTransition.h"

@import AVFoundation;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)setDetailItem:(SocialItem*)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    } 
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *tempImage = [UIImage imageNamed: self.detailItem.imageName];
    CGRect boundingRect = CGRectMake(25, 25, 200, 200);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect(tempImage.size, boundingRect);
    
    UIGraphicsBeginImageContext(self.detailImageView.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, self.detailImageView.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, tempImage.CGImage);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.detailImageView.image = image;
    self.titleLabel.text = self.detailItem.itemName;
    self.detailLabel.text = self.detailItem.itemSummary;
    self.view.backgroundColor = self.detailItem.iconColour;
    
    
}

    
- (IBAction)popViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
