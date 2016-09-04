//
//  FoodDetails.m
//  Navigation Controller
//
//  Created by xax on 7/24/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "FoodDetails.h"
#import "Start.h"
@interface FoodDetails ()

@end

@implementation FoodDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblMunicipality.text           =self.FoodTitle;
    self.lblDescription.text    = self.FoodDescription;
    self.imgMunicipality.image          = [UIImage imageNamed:self.FoodPhoto];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGetLocation:(id)sender {
    [self performSegueWithIdentifier:@"Start" sender:self];
    
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}


@end
