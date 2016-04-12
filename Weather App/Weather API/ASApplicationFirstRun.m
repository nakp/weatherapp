//
//  ASApplicationFirstRun.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/11/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ASApplicationFirstRun.h"

#import "ASWeather.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation ASApplicationFirstRun

+ (BOOL)firstRun
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"firstRun"];
}

+ (void)checkFirstRun
{
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
