//
//  GalleryViewController.m
//  largePhotoApp
//
//  Created by synesthesia on 4/9/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
		
		ImageData *image = self.imageArray[self.indexForRow];

		self.title = [NSString stringWithFormat:@"%lu/%lu",self.indexForRow+1, self.imageArray.count ];
		
		self.backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 70, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame))];
		
		self.backgroundImageView.contentMode = UIViewContentModeScaleToFill;
		self.backgroundImageView.autoresizingMask = ( UIViewAutoresizingFlexibleBottomMargin
																								 | UIViewAutoresizingFlexibleHeight
																								 | UIViewAutoresizingFlexibleLeftMargin
																								 | UIViewAutoresizingFlexibleRightMargin
																								 | UIViewAutoresizingFlexibleTopMargin
																								 | UIViewAutoresizingFlexibleWidth );
		
		self.backgroundImageView.clipsToBounds = YES;

		self.backgroundImageView.image = [UIImage imageWithData:image.imageData];

		[self.view addSubview:self.backgroundImageView];
		
		UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButton:)];
		self.navigationItem.rightBarButtonItem = deleteButton;

 [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateImagesForTimer:) userInfo:Nil repeats:YES];
}

-(void)updateImagesForTimer:(id)sender {

		if (self.indexForRow+1<self.imageArray.count) {
    self.indexForRow++;
		} else {self.indexForRow=0;}
		
		if (self.imageArray !=nil) {
		ImageData *image = self.imageArray[self.indexForRow];
    self.backgroundImageView.image = [UIImage imageWithData:image.imageData];
		} else {
				self.backgroundImageView.image = [UIImage imageNamed:@"placeholder"];
		}
		self.title = [NSString stringWithFormat:@"%lu/%lu",self.indexForRow+1, self.imageArray.count ];
}

-(void)deleteButton:(id)sender{
		
				[[DataStore sharedDataStore].managedObjectContext deleteObject:self.imageArray[self.indexForRow]];
				[[DataStore sharedDataStore] saveContext];
				[[DataStore sharedDataStore] fetchObjects];
				self.imageArray = [DataStore sharedDataStore].arrayForImagesInCD;
				self.title = [NSString stringWithFormat:@"%lu/%lu",self.indexForRow, self.imageArray.count ];
		NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];

				[userDef setBool:YES forKey:@"isFirstRun"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
