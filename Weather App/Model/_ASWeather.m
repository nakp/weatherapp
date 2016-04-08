// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ASWeather.m instead.

#import "_ASWeather.h"

@implementation ASWeatherID
@end

@implementation _ASWeather

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Weather" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Weather";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Weather" inManagedObjectContext:moc_];
}

- (ASWeatherID*)objectID {
	return (ASWeatherID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"humidityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"humidity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pressureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pressure"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"tempValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temp"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"tempMaxValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"tempMax"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"tempMinValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"tempMin"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"time"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windDirectionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windDirection"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windSpeedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windSpeed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic humidity;

- (double)humidityValue {
	NSNumber *result = [self humidity];
	return [result doubleValue];
}

- (void)setHumidityValue:(double)value_ {
	[self setHumidity:@(value_)];
}

- (double)primitiveHumidityValue {
	NSNumber *result = [self primitiveHumidity];
	return [result doubleValue];
}

- (void)setPrimitiveHumidityValue:(double)value_ {
	[self setPrimitiveHumidity:@(value_)];
}

@dynamic pressure;

- (double)pressureValue {
	NSNumber *result = [self pressure];
	return [result doubleValue];
}

- (void)setPressureValue:(double)value_ {
	[self setPressure:@(value_)];
}

- (double)primitivePressureValue {
	NSNumber *result = [self primitivePressure];
	return [result doubleValue];
}

- (void)setPrimitivePressureValue:(double)value_ {
	[self setPrimitivePressure:@(value_)];
}

@dynamic temp;

- (double)tempValue {
	NSNumber *result = [self temp];
	return [result doubleValue];
}

- (void)setTempValue:(double)value_ {
	[self setTemp:@(value_)];
}

- (double)primitiveTempValue {
	NSNumber *result = [self primitiveTemp];
	return [result doubleValue];
}

- (void)setPrimitiveTempValue:(double)value_ {
	[self setPrimitiveTemp:@(value_)];
}

@dynamic tempMax;

- (double)tempMaxValue {
	NSNumber *result = [self tempMax];
	return [result doubleValue];
}

- (void)setTempMaxValue:(double)value_ {
	[self setTempMax:@(value_)];
}

- (double)primitiveTempMaxValue {
	NSNumber *result = [self primitiveTempMax];
	return [result doubleValue];
}

- (void)setPrimitiveTempMaxValue:(double)value_ {
	[self setPrimitiveTempMax:@(value_)];
}

@dynamic tempMin;

- (double)tempMinValue {
	NSNumber *result = [self tempMin];
	return [result doubleValue];
}

- (void)setTempMinValue:(double)value_ {
	[self setTempMin:@(value_)];
}

- (double)primitiveTempMinValue {
	NSNumber *result = [self primitiveTempMin];
	return [result doubleValue];
}

- (void)setPrimitiveTempMinValue:(double)value_ {
	[self setPrimitiveTempMin:@(value_)];
}

@dynamic time;

- (double)timeValue {
	NSNumber *result = [self time];
	return [result doubleValue];
}

- (void)setTimeValue:(double)value_ {
	[self setTime:@(value_)];
}

- (double)primitiveTimeValue {
	NSNumber *result = [self primitiveTime];
	return [result doubleValue];
}

- (void)setPrimitiveTimeValue:(double)value_ {
	[self setPrimitiveTime:@(value_)];
}

@dynamic windDirection;

- (double)windDirectionValue {
	NSNumber *result = [self windDirection];
	return [result doubleValue];
}

- (void)setWindDirectionValue:(double)value_ {
	[self setWindDirection:@(value_)];
}

- (double)primitiveWindDirectionValue {
	NSNumber *result = [self primitiveWindDirection];
	return [result doubleValue];
}

- (void)setPrimitiveWindDirectionValue:(double)value_ {
	[self setPrimitiveWindDirection:@(value_)];
}

@dynamic windSpeed;

- (double)windSpeedValue {
	NSNumber *result = [self windSpeed];
	return [result doubleValue];
}

- (void)setWindSpeedValue:(double)value_ {
	[self setWindSpeed:@(value_)];
}

- (double)primitiveWindSpeedValue {
	NSNumber *result = [self primitiveWindSpeed];
	return [result doubleValue];
}

- (void)setPrimitiveWindSpeedValue:(double)value_ {
	[self setPrimitiveWindSpeed:@(value_)];
}

@dynamic zip;

@end

@implementation ASWeatherAttributes 
+ (NSString *)humidity {
	return @"humidity";
}
+ (NSString *)pressure {
	return @"pressure";
}
+ (NSString *)temp {
	return @"temp";
}
+ (NSString *)tempMax {
	return @"tempMax";
}
+ (NSString *)tempMin {
	return @"tempMin";
}
+ (NSString *)time {
	return @"time";
}
+ (NSString *)windDirection {
	return @"windDirection";
}
+ (NSString *)windSpeed {
	return @"windSpeed";
}
+ (NSString *)zip {
	return @"zip";
}
@end

