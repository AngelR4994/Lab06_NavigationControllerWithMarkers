//
//  Details.m
//  Google Maps
//
//  Created by xax on 8/29/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "Details.h"
#import "Start.h"
#import "OCMapperConfig.h"
#import "Declarations.h"
#import "Parser.h"

#define nUagLat 20.695306
#define nUagLng -103.418190
NSMutableArray *icon_;
@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [OCMapperConfig configure];
    [self Init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)Init {

    Weather *weather                = [Parser parseWeather];
    
    WeatherDetail *weatherDetail    = [weather getWeatherDetail:0];
    icon_=[[NSMutableArray alloc] initWithObjects: @"01d.png", @"02d.png", nil];
 //   weatherDetail.icon = [UIImage imageNamed:maIntroImgs[index]];
    print(NSLog(@"icon %@", weatherDetail.icon))
    print(NSLog(@"Name %@", mWeatherObject.name))
    

    
    mjsonWeatherObject    = [Declarations getWeather:latitude and:latitude];
    mWeatherObject  = [Parser parseWeatherObject];
    
    float tempKelvin        = mWeatherObject.main.temp;
    float tempCelsius       = tempKelvin - 273.15;
    self.lblTemp.text       = [NSString stringWithFormat:@"%.2f", tempCelsius];
    self.lblTempMax.text    = [NSString stringWithFormat:@"%.2f", mWeatherObject.main.temp_max - 273.15];
    self.lblTempMin.text    = [NSString stringWithFormat:@"%.2f", mWeatherObject.main.temp_min - 273.15];
    self.lblPresion.text   = [NSString stringWithFormat:@"%d", mWeatherObject.main.pressure];
    self.lblHumedad.text   = [NSString stringWithFormat:@"%d", mWeatherObject.main.humidity];
    
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
