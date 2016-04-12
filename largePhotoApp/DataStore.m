//
//  DataStore.m
//  largePhotoApp
//
//  Created by synesthesia on 4/11/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+(DataStore *)sharedDataStore
{
		static dispatch_once_t onceToken;
		static DataStore *sharedDataStore;
		dispatch_once(&onceToken, ^{
				sharedDataStore = [[DataStore alloc]init];
		});
		return sharedDataStore;
}

-(instancetype)init
{
		self = [super init];
		if(self){
						//instantiate properties here
				[self fetchObjects];
				_arrayForImagesInCD = [[NSArray alloc]init];
		}
		return self;
}

-(void)fetchObjects
{
		NSFetchRequest *stopTryingToMakeFetchHappen = [NSFetchRequest fetchRequestWithEntityName:@"ImageData"];
		self.arrayForImagesInCD = [self.managedObjectContext executeFetchRequest:stopTryingToMakeFetchHappen error:nil];
}
-(void)saveContext
{
		NSError *error =nil;
		NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
		
		if (managedObjectContext != nil) {
						//replace this implementation with code to handle errors appropriately abort()causes app to generate crash log and terminate, DO NOT USE FOR SHIPPING!!
				if([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
						
						NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
						abort();
				}
		}
}


#pragma mark - Core Data stack

-(NSManagedObjectContext *)managedObjectContext
{
		if (_managedObjectContext != nil){ return _managedObjectContext;}
		
		NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"largePhotoApp1.sqlite"];
		
		NSError *error = nil;
		
		NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
		NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
		
		NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
		
		[coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
		if (coordinator !=nil) {_managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
				[_managedObjectContext setPersistentStoreCoordinator:coordinator];
		} return _managedObjectContext;
}

#pragma mark - Application’s Documents directory

-(NSURL *)applicationDocumentsDirectory
{
		return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
