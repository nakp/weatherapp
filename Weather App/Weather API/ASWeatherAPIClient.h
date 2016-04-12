//
//  ASWeatherAPIClient.h
//  Weather App
//
//  Created by Tomás Figueroa on 4/8/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ASWeather.h"
#import <Foundation/Foundation.h>

@interface ASWeatherAPIClient : NSObject
+ (instancetype _Nonnull)sharedInstance;
- (void)addZIPCode:(NSString *)zipCode completion:(void (^_Nonnull)(void))completionBlock;
- (void)removeZIPCode:(NSString *)zipCode completion:(void (^_Nonnull)(void))completionBlock;
- (void)weatherForZIPCode:(NSString *)ZIPCode
                  success:(void (^)(NSString *weatherID))successBlock
                    error:(void (^)(NSError *error))errorBlock;

@end
