//
//  ASApplicationFirstRun.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/11/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ASApplicationFirstRun.h"

#import "ASWeather.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <MagicalRecord/MagicalRecord.h>

@implementation ASApplicationFirstRun

+ (BOOL)firstRun
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"firstRun"];
}

+ (void)checkFirstRun
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // Set up MagicalRecord
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Model"];
    
    if (![self firstRun]) {
        NSArray *zipCodes = @[ @"10007", @"33128", @"90012" ];

        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *_Nonnull localContext) {
            for (NSString *zipCode in zipCodes) {
                ASWeather *weather = [ASWeather MR_createEntityInContext:localContext];
                weather.zip = zipCode;
            }
        }];

        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"firstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
