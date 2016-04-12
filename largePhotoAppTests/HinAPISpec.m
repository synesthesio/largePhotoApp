		//
		//  HinAPISpec.m
		//  largePhotoApp
		//
		//  Created by synesthesia on 4/12/16.
		//  Copyright 2016 synesthesia. All rights reserved.
		//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "HinAPI.h"
#import <OHHTTPStubs.h>
#import "TestHelper.h"
#import <Asterism.h>





SpecBegin(HinAPI)

describe(@"HinAPI", ^{
		
		__block id<OHHTTPStubsDescriptor> httpStub;
		
		
		
		describe(@"loadImageForImageData:completion:"
						 , ^{
								 
								 beforeEach(^{
								 

										 
										
								 
										 [OHHTTPStubs removeAllStubs];
										 httpStub = [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
												 
												 return [request.URL.host isEqualToString:@"https://hinge-homework.s3.amazonaws.com/client/services/homework.json"];
												 
										 } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
												 
												 return [TestHelper stubResponseWithType:Array];
												 
										 }];
										 
										 
								 });
								 
								 it(@"should make GET request and return array of JSON Dictionary objects", ^{
										 
										 HinAPI *test = [[HinAPI alloc] init];
										 [test loadImageInformationWithCompletion:^{
										 
												NSArray *stuff =  [DataStore sharedDataStore].arrayForImagesInCD;
												 NSLog(@"The stuff that is printing is : %@", stuff);
												 
												 expect(stuff).to.beAKindOf([NSArray class]);

//
												 
										 }];
										 
										 
										 
												 //
												 //										 HinAPI *HinAPIForTest = [[HinAPI alloc]init];
												 //								 [HinAPIForTest loadImageInformationWithCompletion:^{
												 //
												 //								 }];
										 
										 
								 });
								 
								 
						 });
		
		
		
//		beforeAll(^{
//				
//		});
//		
//		beforeEach(^{
//				
//		});
//		
//		it(@"", ^{
//				
//		});
//		
//		afterEach(^{
//				
//		});
//		
//		afterAll(^{
//				
//		});
});

SpecEnd
