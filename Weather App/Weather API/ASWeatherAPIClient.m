//
//  ASWeatherAPIClient.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/8/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "ASWeatherAPIClient.h"

static NSString *const kAPIBaseURL = @"http://api.openweathermap.org/data/2.5/";
static NSString *const kAPIKey = @"2265a3200927fff69422588140d1ad9c";

@interface ASWeatherAPIClient ()
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@end

@implementation ASWeatherAPIClient

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURL]];
        _manager.requestSerializer = [AFJSONRequestSerializer new];
    }

    return _manager;
}

+ (instancetype)sharedInstance
{
    static ASWeatherAPIClient *instance;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });

    return instance;
}

- (NSMutableDictionary *)defautlParameters
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:kAPIKey forKey:@"APPID"];

    return params;
}

- (void)getWeatherForZIPCode:(NSString *)ZIPCode
                     success:(void (^)(NSDictionary *object))successBlock
                       error:(void (^)(NSError *error))errorBlock
{
    NSMutableDictionary *params = [self defautlParameters];
    [params addEntriesFromDictionary:@{ @"zip" : ZIPCode }];

    [self.manager GET:@"weather"
        parameters:params
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            successBlock(responseObject);
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            errorBlock(error);
        }];
}

@end
