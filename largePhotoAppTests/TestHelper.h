//
//  TestHelper.h
//  largePhotoApp
//
//  Created by synesthesia on 4/12/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OHHTTPStubs.h>

@interface TestHelper : NSObject
typedef NS_ENUM(NSInteger, StubResponseType) {
		Dictionary,
		Array,
		TriviaDictionary,
};
+ (OHHTTPStubsResponse *)stubResponseWithType:(StubResponseType)type;
+(NSArray *)createFakeJSONDictionary;

@end
