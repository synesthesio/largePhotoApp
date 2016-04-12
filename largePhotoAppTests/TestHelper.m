//
//  TestHelper.m
//  largePhotoApp
//
//  Created by synesthesia on 4/12/16.
//  Copyright © 2016 synesthesia. All rights reserved.
//

#import "TestHelper.h"

@interface TestHelper()



@end

@implementation TestHelper

+ (OHHTTPStubsResponse *)stubResponseWithType:(StubResponseType)type {

 NSString *fakeArrayJSON = [[NSBundle mainBundle] pathForResource:@"FakeFinalArrayJSON" ofType:@"json"];
		
		switch (type) {
						
				case Array: {
						
						
						return [OHHTTPStubsResponse responseWithFileAtPath:fakeArrayJSON
																										statusCode:200
																											 headers:@{ @"Content-type": @"application/json"}];
						break;
				}
				default:
						
						return nil;
						break;
		}
}
@end
