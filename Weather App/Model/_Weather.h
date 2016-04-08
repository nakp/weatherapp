// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Weather.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WeatherID : NSManagedObjectID {}
@end

@interface _Weather : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WeatherID *objectID;

@property (nonatomic, strong, nullable) NSNumber* humidity;

@property (atomic) double humidityValue;
- (double)humidityValue;
- (void)setHumidityValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* pressure;

@property (atomic) double pressureValue;
- (double)pressureValue;
- (void)setPressureValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* temp;

@property (atomic) double tempValue;
- (double)tempValue;
- (void)setTempValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* tempMax;

@property (atomic) double tempMaxValue;
- (double)tempMaxValue;
- (void)setTempMaxValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* tempMin;

@property (atomic) double tempMinValue;
- (double)tempMinValue;
- (void)setTempMinValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* time;

@property (atomic) double timeValue;
- (double)timeValue;
- (void)setTimeValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* windDirection;

@property (atomic) double windDirectionValue;
- (double)windDirectionValue;
- (void)setWindDirectionValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* windSpeed;

@property (atomic) double windSpeedValue;
- (double)windSpeedValue;
- (void)setWindSpeedValue:(double)value_;

@property (nonatomic, strong, nullable) NSString* zip;

@end

@interface _Weather (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveHumidity;
- (void)setPrimitiveHumidity:(NSNumber*)value;

- (double)primitiveHumidityValue;
- (void)setPrimitiveHumidityValue:(double)value_;

- (NSNumber*)primitivePressure;
- (void)setPrimitivePressure:(NSNumber*)value;

- (double)primitivePressureValue;
- (void)setPrimitivePressureValue:(double)value_;

- (NSNumber*)primitiveTemp;
- (void)setPrimitiveTemp:(NSNumber*)value;

- (double)primitiveTempValue;
- (void)setPrimitiveTempValue:(double)value_;

- (NSNumber*)primitiveTempMax;
- (void)setPrimitiveTempMax:(NSNumber*)value;

- (double)primitiveTempMaxValue;
- (void)setPrimitiveTempMaxValue:(double)value_;

- (NSNumber*)primitiveTempMin;
- (void)setPrimitiveTempMin:(NSNumber*)value;

- (double)primitiveTempMinValue;
- (void)setPrimitiveTempMinValue:(double)value_;

- (NSNumber*)primitiveTime;
- (void)setPrimitiveTime:(NSNumber*)value;

- (double)primitiveTimeValue;
- (void)setPrimitiveTimeValue:(double)value_;

- (NSNumber*)primitiveWindDirection;
- (void)setPrimitiveWindDirection:(NSNumber*)value;

- (double)primitiveWindDirectionValue;
- (void)setPrimitiveWindDirectionValue:(double)value_;

- (NSNumber*)primitiveWindSpeed;
- (void)setPrimitiveWindSpeed:(NSNumber*)value;

- (double)primitiveWindSpeedValue;
- (void)setPrimitiveWindSpeedValue:(double)value_;

- (NSString*)primitiveZip;
- (void)setPrimitiveZip:(NSString*)value;

@end

@interface WeatherAttributes: NSObject 
+ (NSString *)humidity;
+ (NSString *)pressure;
+ (NSString *)temp;
+ (NSString *)tempMax;
+ (NSString *)tempMin;
+ (NSString *)time;
+ (NSString *)windDirection;
+ (NSString *)windSpeed;
+ (NSString *)zip;
@end

NS_ASSUME_NONNULL_END
