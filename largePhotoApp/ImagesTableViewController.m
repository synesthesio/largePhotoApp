		//
		//  ImagesTableViewController.m
		//  largePhotoApp
		//
		//  Created by synesthesia on 4/9/16.
		//  Copyright © 2016 synesthesia. All rights reserved.
		//

#import "ImagesTableViewController.h"

@interface ImagesTableViewController ()

@end

@implementation ImagesTableViewController
- (void)viewDidLoad {
		[super viewDidLoad];
		

		
		
		[self.tableView setAccessibilityLabel:@"imageTable"];
		[self.tableView setAccessibilityIdentifier:@"imageTable"];
		[self setAccessibilityLabel:@"imageTable Controller"];
		
		self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		self.tableView.frame = CGRectMake(0,
																			0,
																			CGRectGetWidth(self.view.frame),
																			CGRectGetHeight(self.view.frame));
		[[DataStore sharedDataStore] fetchObjects];
		
		
		HinAPI *hinAPI = [HinAPI new];
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		BOOL isFirstRun = [defaults boolForKey:@"isFirstRun"];
		
		
		
		
		if (isFirstRun == NO) {

    self.imageCount = 14;
		} else {
				[[DataStore sharedDataStore] fetchObjects];
				self.imageArray = [DataStore sharedDataStore].arrayForImagesInCD;
				[self.tableView reloadData];
				self.imageCount = [DataStore sharedDataStore].arrayForImagesInCD.count;
				
		}
		
		
				//
		if (isFirstRun == NO) {
    [hinAPI loadImageInformationWithCompletion:^{
				[[DataStore sharedDataStore] fetchObjects];
				self.imageArray = [DataStore sharedDataStore].arrayForImagesInCD;
				[self.tableView reloadData];
		}];
		}
}

-(void)viewDidAppear:(BOOL)animated
{
		[[DataStore sharedDataStore] fetchObjects];
		self.imageCount = [DataStore sharedDataStore].arrayForImagesInCD.count;
		[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
		[super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return self.imageArray.count;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
		
		ImageTableViewCell *cell = (ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
		cell.imageDataForCell = self.imageArray[indexPath.row];
		if(cell.imageDataForCell.imageData!=nil) {
				cell.imageViewForCell.image = [UIImage imageWithData:cell.imageDataForCell.imageData];
		}
		else {
				cell.imageViewForCell.image = [UIImage imageNamed:@"placeholder"];
				[[HinAPI new] loadImageForImageData:cell.imageDataForCell completion:^{
						if (cell.imageDataForCell.imageData!=nil) {
								cell.imageViewForCell.image = [UIImage imageWithData:cell.imageDataForCell.imageData];
						} else {
								cell.imageViewForCell.image = [UIImage imageNamed:@"placeholder"];
						}
				}];
		}
		cell.imageViewForCell.contentMode = UIViewContentModeScaleToFill;
		cell.imageViewForCell.frame = CGRectMake(20, 5, cell.frame.size.width-40, CGRectGetHeight(cell.frame)-10);
		cell.imageViewForCell.autoresizingMask =
		( UIViewAutoresizingFlexibleBottomMargin
		 | UIViewAutoresizingFlexibleHeight
		 | UIViewAutoresizingFlexibleLeftMargin
		 | UIViewAutoresizingFlexibleRightMargin
		 | UIViewAutoresizingFlexibleTopMargin
		 | UIViewAutoresizingFlexibleWidth );
		return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
		
		NSIndexPath *indexPathOfRowTapped = self.tableView.indexPathForSelectedRow;
		UINavigationController *navVC = segue.destinationViewController;
		GalleryViewController *galleryVC = navVC.topViewController;
		galleryVC.imageArray = self.imageArray;
		galleryVC.indexForRow = indexPathOfRowTapped.row;
}
@end
