//
//  Weather.m
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Weather.h"

@implementation Weather


-(WeatherDetail *)getWeatherDetail: (int) index{
    
    return self.weatherDetails[index];
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.weatherDetails = [[NSMutableArray alloc] init];
    }
    return self;
    
}

@end
