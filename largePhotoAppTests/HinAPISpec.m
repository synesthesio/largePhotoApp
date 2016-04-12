		//
		//  HinAPISpec.m
		//  largePhotoApp
		//
		//  Created by synesthesia on 4/12/16.
		//  Copyright 2016 synesthesia. All rights reserved.
		//

#import "Specta.h"
#import "AppDelegate.h"
#import "OHHTTPStubs.h"
#import "HinAPI.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import <Asterism.h>
#import "TestHelper.h"
#import "ImageData.h"





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

										 waitUntil(^(DoneCallback done) {
										 
												 [test loadImageInformationWithCompletion:^{
														 
														 NSArray *stuff =  [DataStore sharedDataStore].arrayForImagesInCD;
														 
														 ImageData *data = stuff[0];
														 NSString *name = data.name;
														 NSString *imageURL = data.imageURL;
														 NSString *desc = data.desc;
														
														 expect(stuff).to.beAKindOf([NSArray class]);
														 expect(stuff.count).to.equal([DataStore sharedDataStore].arrayForImagesInCD.count);
														 expect(desc).to.equal(@"Golden Toad");
														 expect(imageURL).to.equal(@"http://pop.h-cdn.co/assets/15/31/980x775/gallery-1438368282-golden-toad.jpg");
														 done();

												 }];
												 


										 
										 });
								 
								 });
								 
						 });
		
});

SpecEnd
