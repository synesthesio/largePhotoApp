//
//  ImageTableViewCell.h
//  largePhotoApp
//
//  Created by synesthesia on 4/9/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageData.h"
@interface ImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewForCell;
@property (strong, nonatomic) ImageData *imageDataForCell;
@end
