//
//  ImageTableViewCell.m
//  largePhotoApp
//
//  Created by synesthesia on 4/9/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
		self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
		if (self) {
		}
		return self;
}

- (void)awakeFromNib {

		UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
		self.imageViewForCell.image = placeholderImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
