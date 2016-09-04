//
//  ViewController.m
//  Navigation Controller
//
//  Created by xax on 7/23/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "Home.h"
#import "Declaration.h"
NSUInteger intMuniciplitySelected;


@interface Home ()

@property NSMutableArray *MunicipalyDescriptions;
@property NSMutableArray *MunicipalyPhotos;
@property NSMutableArray *MunicipalityTitles;

@property NSString *stTitleSelected;
@property NSString *stDescriptionSelected;
@property NSString *stPhotoSelected;
@property NSString *StateSelected;


@end

@implementation Home
/************************************************************************/
#pragma mark - Initializatino methods
/************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {//Funtion to initialize the variables.
    
    switch(intMuniciplitySelected)
    {
        case 0://Jalisco
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Tequila", @"Tomatlán", nil];
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"gua.jpg", @"zap.jpg", @"tla.jpg", @"teq.jpg", @"tom.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Tierra de charros, jaripeos, mariachi y tequila.", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];
            break;
        case 1://Oaxaca
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Abejones", @"Acatlán de Pérez Figueroa", @"Oaxaca", @"Huatulco", @"Tomatlán", nil];
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Tierra de charros, jaripeos, mariachi y tequila.", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];
        break;
        case 2://Yucatán
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Akil", @"Baca", @"Cacalchén", @"Cantamayec", @"Celestún", nil];
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Solo se vive una vez, nimate!!", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];
            break;
        case 3://Chiapas
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Abejones", @"Acatlán de Pérez Figueroa", @"Tlaquepaque", @"Tequila", @"Tomatlán", nil];
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Solo se vive una vez, nimate!!", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];
            break;
        case 4://Querétaro
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Jalpan de Serra", @"Corregidora", @"Huimilpan", @"Peñamiller", @"Querétaro", nil];
            
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Solo se vive una vez, nimate!!", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];
            break;

        default://Jalisco
            self.MunicipalityTitles = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Tequila", @"Tomatlán", nil];
            self.MunicipalyPhotos   = [[NSMutableArray alloc] initWithObjects: @"Jalisco.png", @"Oaxaca.png", @"Yucatán.jpg", @"Chiapas.jpg", @"Querétaro.jpg", nil];
            self.MunicipalyDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Solo se vive una vez, nimate!!", @"El municipio más biodiverso de México", @"" , @"Concientete, te lo mereces", @"Has realidad tu sueños", nil];

        break;
    }
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MunicipalityTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    //Fill cell with info from arrays
    
    cell.lblFood.text = self.MunicipalityTitles[indexPath.row];
    cell.lblDescription.text= self.MunicipalyDescriptions[indexPath.row];
    cell.imgFood.image =[UIImage imageNamed:self.MunicipalyPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.stTitleSelected        =   self.MunicipalityTitles[indexPath.row];
    self.stDescriptionSelected  =   self.MunicipalyDescriptions[indexPath.row];
    self.stPhotoSelected        =   self.MunicipalyPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"FoodDetails" sender:self];
    
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[FoodDetails class]])
    {
        FoodDetails *Food =[segue destinationViewController];
        Food.FoodTitle          = self.stTitleSelected;
        Food.FoodDescription    = self.stDescriptionSelected;
        Food.FoodPhoto          = self.stPhotoSelected;
    }
}

@end
