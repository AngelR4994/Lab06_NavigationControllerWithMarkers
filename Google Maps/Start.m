//
//  ViewController.m
//  Google Maps
//
//  Created by xax on 8/11/16.
//  Copyright © 2016 xax. All rights reserved.
//
#import "Start.h"
#import <Google/Analytics.h>
#import "Details.h"
#import "Declaration.h"

@import GoogleMaps;
long latitude;
long longitude;
@interface Start ()
@end
@implementation Start {
    GMSMapView *mapView_;
    GMSCameraPosition *camera;
   // GMSMarker *marker;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    GMSMarker *marker = [[GMSMarker alloc] init];
    
    switch (gintMuniciplitySelected) {
        case 0://Jalisco
            camera = [GMSCameraPosition cameraWithLatitude:20.666222 longitude:-103.352089 zoom:7];
            break;
        case 1://Oaxaca
            camera = [GMSCameraPosition cameraWithLatitude:16.966061 longitude:-97.166730 zoom:7];
            break;
        case 2://Yucatan
            camera = [GMSCameraPosition cameraWithLatitude:20.686895 longitude:-89.009354 zoom:7];
            break;
        case 3://Chiapas
            camera = [GMSCameraPosition cameraWithLatitude:16.809632 longitude: -92.590117 zoom:7];
            break;
        case 4://Queretaro
            camera = [GMSCameraPosition cameraWithLatitude:20.972285 longitude:-101.311099 zoom:7];
            break;
        default:
            camera = [GMSCameraPosition cameraWithLatitude:20.592225 longitude:-103.331011 zoom:7];
            break;
    }
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    marker.position = camera.target;
    marker.map = mapView_;
    self.view = mapView_;
    
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
    // Create a GMSCameraPosition that tells the map to display t
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    //marker.map=mapView_;
    mapView_.delegate=self;
    self.view = mapView_;
}
@end
