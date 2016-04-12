//
//  HinAPI.m
//  largePhotoApp
//
//  Created by synesthesia on 4/10/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import "HinAPI.h"

@implementation HinAPI

NSString *const API_URL = @"https://hinge-homework.s3.amazonaws.com/client/services/homework.json";

-(void)loadImageInformationWithCompletion:(void (^)(void))completionBlock
{
		NSURL *urlForSession = [NSURL URLWithString:API_URL];
		NSURLSession *session = [NSURLSession sharedSession];
		NSURLSessionTask *sessionTask = [session dataTaskWithURL:urlForSession completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		
		
		
				NSArray *responseArrayOfDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
				for (int x = 0; x<responseArrayOfDictionaries.count; x++){
								NSDictionary *responseDictionary = responseArrayOfDictionaries[x];
								dispatch_sync(dispatch_get_main_queue(), ^{
										NSManagedObjectContext *objectContext = [DataStore sharedDataStore].managedObjectContext;
										ImageData *newImageData = [NSEntityDescription insertNewObjectForEntityForName:@"ImageData" inManagedObjectContext:objectContext];
										newImageData.order = x+1;
										NSString *stringForURL = [NSString stringWithFormat:responseDictionary[@"imageURL"]];
										newImageData.imageURL = stringForURL;
										newImageData.name = [NSString stringWithFormat:responseDictionary[@"imageName"]];
										newImageData.desc = [NSString stringWithFormat:responseDictionary[@"imageDescription"]];
										[[DataStore sharedDataStore] saveContext];
								});
				}
				dispatch_async(dispatch_get_main_queue(), ^{
						NSLog(@"Completion block gettting called!!!!!!!!!!!!!!!!!");
						completionBlock();
				});
		}];
		[sessionTask resume];
}

-(void)loadImageForImageData:(ImageData *)imageData completion:(void (^)(void))completionBlock
{
		[[DataStore sharedDataStore] fetchObjects];
		for (ImageData *newImageData in [DataStore sharedDataStore].arrayForImagesInCD) {
				NSOperationQueue *bgQueue = [[NSOperationQueue alloc] init];
				[bgQueue addOperationWithBlock:^{
				NSURLSession *session = [NSURLSession sharedSession];
						NSURL *urlForNewImageData = [NSURL URLWithString:newImageData.imageURL];
				NSURLSessionTask *sessionTask = [session dataTaskWithURL:urlForNewImageData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
						NSInteger statusCode = 0;
						NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
						if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
								statusCode = httpResponse.statusCode;
						}
						if (data !=nil && statusCode ==200) {
								newImageData.imageData = data;
								[[DataStore sharedDataStore] saveContext];
						} else {
								UIImage *placeHolderImage = [UIImage imageNamed:@"placeholder"];
								NSData *placeholderData = UIImagePNGRepresentation(placeHolderImage);
								newImageData.imageData = placeholderData;
								[[DataStore sharedDataStore] saveContext];
						}
						}];
						[sessionTask resume];
						dispatch_async(dispatch_get_main_queue(), ^{
								completionBlock();
						});
				}];
		}
}

-(NSUInteger)isFirstLoad {

		self.initialImageCount = 0;
		NSURLSession *session = [NSURLSession sharedSession];
		NSURL *urlForNewImageData = [NSURL URLWithString:API_URL];
		NSURLSessionTask *sessionTask = [session dataTaskWithURL:urlForNewImageData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		NSArray *responseArrayOfDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
				for (NSDictionary *dictionary in responseArrayOfDictionaries) {
						self.initialImageCount ++;
				}
				
		}]; [sessionTask resume];

		return self.initialImageCount;
}

@end
