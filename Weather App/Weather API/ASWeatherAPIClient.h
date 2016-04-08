//
//  ASWeatherAPIClient.h
//  Weather App
//
//  Created by Tomás Figueroa on 4/8/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASWeatherAPIClient : NSObject
+ (instancetype _Nonnull)sharedInstance;
- (void)getWeatherForZIPCode:(NSString *)ZIPCode
                     success:(void (^)(NSDictionary *object))successBlock
                       error:(void (^)(NSError *error))errorBlock;

@end
