//
//  HinAPI.h
//  largePhotoApp
//
//  Created by synesthesia on 4/10/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "DataStore.h"
#import <CoreData/CoreData.h>
#import "ImageData.h"
#import "ImageData+CoreDataProperties.h"

@interface HinAPI : NSObject

-(void)loadImageForImageData:(ImageData *)imageData completion:(void (^)(void))completionBlock;
-(void)loadImageInformationWithCompletion:(void (^)(void))completionBlock;

-(NSUInteger)isFirstLoad;
@property (nonatomic) NSArray *arrayForOriginalImages;
@property (nonatomic) NSUInteger initialImageCount;

@end
