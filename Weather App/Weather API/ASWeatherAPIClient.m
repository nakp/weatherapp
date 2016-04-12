//
//  ASWeatherAPIClient.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/8/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <MagicalRecord/MagicalRecord.h>

#import "ASWeatherAPIClient.h"

static NSString *const kAPIBaseURL = @"http://api.openweathermap.org/data/2.5/";
static NSString *const kAPIKey = @"2265a3200927fff69422588140d1ad9c";

@interface ASWeatherAPIClient ()
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (readonly) BOOL reachable;
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

- (BOOL)reachable
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
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

- (ASWeather *)weatherWithZIPCode:(NSString *)zipCode
{
    return [ASWeather MR_findFirstByAttribute:zipCode withValue:@"zip"];
}

- (NSMutableDictionary *)defautlParameters
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:kAPIKey forKey:@"APPID"];

    return params;
}

- (void)addZIPCode:(NSString *)zipCode completion:(void (^)(void))completionBlock
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *_Nonnull localContext) {
        ASWeather *weather = [ASWeather MR_createEntityInContext:localContext];
        weather.zip = zipCode;
    }
        completion:^(BOOL contextDidSave, NSError *_Nullable error) {
            completionBlock();
        }];
}

- (void)removeZIPCode:(NSString *)zipCode completion:(void (^)(void))completionBlock
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *_Nonnull localContext) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"zip = %@", zipCode];
        [ASWeather MR_deleteAllMatchingPredicate:predicate inContext:localContext];
    }
        completion:^(BOOL contextDidSave, NSError *_Nullable error) {
            completionBlock();
        }];
}

- (void)weatherForZIPCode:(NSString *)ZIPCode
                  success:(void (^)(NSString *weatherID))successBlock
                    error:(void (^)(NSError *error))errorBlock
{
    NSMutableDictionary *params = [self defautlParameters];
    [params addEntriesFromDictionary:@{ @"zip" : ZIPCode }];
    [params addEntriesFromDictionary:@{ @"weatherID" : ZIPCode }];

    // If there's no connection, try to serve the latest cached result
    if (!self.reachable) {
        ASWeather *weather = [ASWeather MR_findFirstByAttribute:@"zip" withValue:ZIPCode];
        if (!weather || !weather.weatherID.length) {
            NSError *error = [[NSError alloc] initWithDomain:@"WeatherApp" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Information can't be retreived"}];
            errorBlock(error);
            return;
        }
        successBlock(weather.weatherID);
        return;
    }

    [self.manager GET:@"weather"
        parameters:params
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            if (responseObject) {
                NSMutableDictionary *response = [(NSDictionary *)responseObject mutableCopy];

                // the API sends an array with weather conditions,
                // just save the first one and add the zip
                NSString *weatherCondition = [[[response objectForKey:@"weather"] firstObject] objectForKey:@"main"];
                NSString *weatherDescription =
                    [[[response objectForKey:@"weather"] firstObject] objectForKey:@"description"];
                [response setObject:weatherCondition forKey:@"weatherCondition"];
                [response setObject:weatherDescription forKey:@"weatherDescription"];
                [response setObject:ZIPCode forKey:@"zip"];
                [self saveWeather:response success:successBlock error:errorBlock];
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            errorBlock(error);
        }];
}

- (void)saveWeather:(NSDictionary *)responseObject
            success:(void (^)(NSString *weatherID))successBlock
              error:(void (^)(NSError *error))errorBlock
{
    __block ASWeather *weather;
    __block NSString *weatherID;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *_Nonnull localContext) {
        weather = [ASWeather MR_importFromObject:responseObject inContext:localContext];
        weatherID = weather.weatherID;
    }
        completion:^(BOOL contextDidSave, NSError *_Nullable error) {
            if (error && !contextDidSave) {
                errorBlock(error);
                return;
            }
            if (!weatherID || !weatherID.length) {
                errorBlock(error);
                return;
            }
            successBlock(weatherID);
        }];
}

@end
