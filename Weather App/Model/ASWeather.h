#import "_ASWeather.h"

@interface ASWeather : _ASWeather
// Custom logic goes here.
+ (NSFetchedResultsController *)allWeatherWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;
+ (instancetype)weatherWithWeatherID:(NSString *)weatherID;

- (void)deleteObject;

@end
