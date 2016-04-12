//
//  ImageData+CoreDataProperties.h
//  
//
//  Created by synesthesia on 4/11/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ImageData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSString *imageURL;
@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) int64_t order;

@end

NS_ASSUME_NONNULL_END
