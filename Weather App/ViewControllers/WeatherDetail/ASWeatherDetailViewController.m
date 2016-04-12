//
//  ASWeatherDetailViewController.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/8/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ASWeatherAPIClient.h"

#import "ASWeatherDetailViewController.h"

@interface ASWeatherDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *zipCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherConditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;

@end

@implementation ASWeatherDetailViewController

- (void)showWeather:(ASWeather *)weather
{
    self.zipCodeLabel.text = weather.zip;
    self.cityLabel.text = weather.name;
    self.weatherConditionLabel.text = weather.weatherCondition;
    self.weatherDescriptionLabel.text = weather.weatherDescription;
    self.temperatureLabel.text = [self formatTemperature:weather.temp];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"H %@", [self formatTemperature:weather.tempMax]];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"L %@", [self formatTemperature:weather.tempMin]];
}

- (NSString *)formatTemperature:(NSNumber *)temperature
{
    // Convert from kelvin to celcius
    // this should be integrated in the client
    // and allow to convert between any temperature format
    double temp = temperature.doubleValue - 271.15;
    return [NSString stringWithFormat:@"%.0fC", temp];
}

#pragma mark - ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showWeather:self.weather];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
