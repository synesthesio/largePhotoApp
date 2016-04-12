//
//  ImagesTableViewController.h
//  largePhotoApp
//
//  Created by synesthesia on 4/9/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HinAPI.h"
#import "ImageTableViewCell.h"
#import "DataStore.h"
#import "ImageData.h"
#import "ImageData+CoreDataProperties.h"
#import "GalleryViewController.h"

@interface ImagesTableViewController : UITableViewController

@property (nonatomic)__block NSArray *imageArray;
@property (nonatomic) NSUInteger imageCount;
@end
