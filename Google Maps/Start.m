//
//  ViewController.m
//  Google Maps
//
//  Created by xax on 8/11/16.
//  Copyright © 2016 xax. All rights reserved.
//
#import "Start.h"
#import <Google/Analytics.h>
@import GoogleMaps;

@interface Start ()

@end

@implementation Start {
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    //[self viewWillAppear];
}
-(void)viewWillAppear:(BOOL)animated
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:36.200621		
                                                            longitude:-115.275286
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(36.200621, -115.275286);
    marker.title = @"UAG";
    marker.snippet = @"Clase de Maestría";
    marker.map = mapView_;
}

@end
