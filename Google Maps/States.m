//
//  StatesViewController.m
//  Navigation Controller
//
//  Created by xax on 8/8/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "States.h"
#import "Declaration.h"

@interface States ()

@property NSMutableArray *StatesTitles;
@property NSMutableArray *StatesDescriptions;
@property NSMutableArray *StatesPhotos;

@property NSString *stStateSelected;

@end

@implementation States
/************************************************************************/
#pragma mark - Initializatino methods
/************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {//Funtion to initialize the variables.
    self.StatesTitles   = [[NSMutableArray alloc] initWithObjects: @"Jalisco", @"Oaxaca", @"Yucatán", @"Chiapas", @"Querétaro", nil];
    self.StatesPhotos   = [[NSMutableArray alloc] initWithObjects: @"Jalisco.png", @"Oaxaca.png", @"Yucatán.jpg", @"Chiapas.jpg", @"Querétaro.jpg", nil];
    self.StatesDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Tierra de charros, jaripeos, mariachi y tequila.", @"El estado más biodiverso de México", @"El estado de Yucatán mantiene una amplia diversidad de fauna." , @"Chiapas posee varios de los destinos turísticos más importantes de México", @"Cuna de la Independencia de México", nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.StatesTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellStates *cell = (cellStates *)[tableView dequeueReusableCellWithIdentifier:@"cellStates"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellStates" bundle:nil] forCellReuseIdentifier:@"cellStates"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellStates"];
    }
    //Fill cell with info from arrays
    cell.lblStates.text = self.StatesTitles[indexPath.row];
    cell.lblStatesDescription.text= self.StatesDescriptions[indexPath.row];
    cell.imgStates.image =[UIImage imageNamed:self.StatesPhotos[indexPath.row]];
    
    return cell;

}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stStateSelected        =   self.StatesTitles[indexPath.row];
    intMuniciplitySelected= [self.StatesTitles indexOfObject: self.StatesTitles[indexPath.row]];
    gintMuniciplitySelected= [self.StatesTitles indexOfObject: self.StatesTitles[indexPath.row]];
    [self performSegueWithIdentifier:@"Home" sender:self];
    
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[Home class]])
    {
        Home *pHome              = [segue destinationViewController];
        pHome.StateTitle         = self.stStateSelected;
    }
}
@end
