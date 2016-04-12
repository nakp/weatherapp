#import "ASWeather.h"
#import <MagicalRecord/MagicalRecord.h>

@interface ASWeather ()

// Private interface goes here.

@end

@implementation ASWeather

// Custom logic goes here.

+ (instancetype)weatherWithWeatherID:(NSString *)weatherID
{
    return [ASWeather MR_findFirstByAttribute:@"weatherID" withValue:weatherID];
}

+ (NSFetchedResultsController *)allWeatherWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate
{
    return [ASWeather MR_fetchAllSortedBy:@"zip" ascending:YES withPredicate:nil groupBy:nil delegate:delegate];
}

- (void)deleteObject
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        [self MR_deleteEntityInContext:localContext];
    }];
}

@end
