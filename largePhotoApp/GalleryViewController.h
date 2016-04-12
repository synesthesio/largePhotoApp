//
//  GalleryViewController.h
//  largePhotoApp
//
//  Created by synesthesia on 4/9/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DataStore.h"
#import "ImageData.h"
#import "ImageData+CoreDataProperties.h"
#import "ImagesTableViewController.h"

@interface GalleryViewController : UIViewController

@property (nonatomic) NSInteger indexForRow;
@property (nonatomic)__block NSArray *imageArray;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;

@end
