//
//  DataStore.h
//  largePhotoApp
//
//  Created by synesthesia on 4/11/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStore : NSObject
+(DataStore *)sharedDataStore;
@property (nonatomic, strong)NSArray *arrayForImagesInCD;//some non-mutable object
-(void)fetchObjects;
@property(nonatomic, strong)NSManagedObjectContext *managedObjectContext;
-(void)saveContext;

@end
