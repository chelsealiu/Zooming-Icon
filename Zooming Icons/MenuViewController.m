//
//  MenuViewController.m
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "MenuViewController.h"
#import "SocialItemCell.h"
#import "SocialItem.h"
#import "UIColor+ItemColors.h"
#import "DetailViewController.h"
#import "ZoomingIconTransition.h"

@import AVFoundation;

@interface MenuViewController () 

@property(strong, nonatomic) NSArray *itemsArray;

@end

@implementation MenuViewController


- (void)viewDidLoad {
    [super viewDidLoad];

//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"SocialCell"];
    
    //use [CIColor colorWithString:@""] and then [UIColor colorWithCIColor:CIColor] to convert colour
    SocialItem *twitterItem = [[SocialItem alloc] initWithName:@"Twitter" summary:@"Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\"." imageString:@"icon-twitter" andColour:[UIColor twitterColour]];
    
    SocialItem *facebookItem = [[SocialItem alloc] initWithName:@"Facebook" summary: @"Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities." imageString:@"icon-facebook" andColour:[UIColor facebookColour]];
    
    SocialItem *youtubeItem = [[SocialItem alloc] initWithName:@"YouTube" summary:@"YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos."imageString:@"icon-youtube" andColour:[UIColor youtubeColour]];
    
    SocialItem *vimeoItem = [[SocialItem alloc] initWithName:@"Vimeo" summary:@"Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein." imageString:@"icon-vimeo" andColour: [UIColor vimeoColour]];
    
    SocialItem *instagramItem = [[SocialItem alloc] initWithName:@"Instagram" summary:@"Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr." imageString:@"icon-instagram" andColour: [UIColor instagramColour]];
    
    self.itemsArray = @[twitterItem, facebookItem, youtubeItem, vimeoItem, instagramItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 2;
    }
    
    return 3;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    //check isKindOfClass before casting
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout*) collectionView.collectionViewLayout;
    
    CGFloat viewWidth = self.collectionView.bounds.size.width; //width of view
    CGFloat viewHeight = self.collectionView.bounds.size.height; //height of view
    CGFloat cellQuantity = [self.collectionView numberOfItemsInSection:section]; //number of cells
    CGFloat sectionQuantity = [self.collectionView numberOfSections];
    CGFloat cellWidth = flow.itemSize.width; //width of cell
    CGFloat cellHeight = flow.itemSize.height; //height of cell
    CGFloat cellPadding = 10; //cell padding on all sides
    
    CGFloat offset = (viewWidth - cellQuantity * cellWidth - (cellQuantity) * cellPadding)/2;
    CGFloat top;
    CGFloat bottom;
    
    if (section == 0) {
        top = (viewHeight - cellQuantity * cellHeight - (sectionQuantity) * cellPadding)/2;
        bottom = cellPadding;
    } else if (section == [self.collectionView numberOfSections] - 1) {
        top = cellPadding;
        bottom = (viewHeight - cellQuantity * cellHeight - (sectionQuantity) * cellPadding)/2;
    } else {
        top = cellPadding;
        bottom = cellPadding;
    }
    
    return UIEdgeInsetsMake(top, offset, bottom, offset);
    
}

- (SocialItemCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SocialItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SocialCell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = cell.frame.size.width/2;
    
    NSInteger index = [self getAbsoluteIndex:indexPath];
    
    //use layoutsubviews?
    
    SocialItem *socialItem = self.itemsArray[index];

    cell.backgroundColor = socialItem.iconColour;

    UIImage *tempImage = [UIImage imageNamed: socialItem.imageName];
    CGRect boundingRect = CGRectMake(20, 20, 60, 60);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect(tempImage.size, boundingRect);
    
    UIGraphicsBeginImageContext(cell.imageView.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    //flip image to correct orientation
    CGContextTranslateCTM(context, 0, cell.imageView.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, tempImage.CGImage);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    cell.imageView.image = image;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = [self getAbsoluteIndex:indexPath];
    SocialItem *tempSocialItem = self.itemsArray[index];
    
    
    
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [detailVC setDetailItem:tempSocialItem];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


-(NSInteger)getAbsoluteIndex:(NSIndexPath*)indexPath {
    
    NSInteger index = indexPath.row;
    
    for (NSInteger i = 0; i < indexPath.section; i ++) {
        NSInteger tempSectionSize = [self.collectionView numberOfItemsInSection: i];
        index += tempSectionSize;
    }
    
    return index;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
