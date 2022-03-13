//
//  ModificaPermanenzaViewController.m
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 23/11/21.
//

#import "ModificaPermanenzaViewController.h"
#import "Permanenza.h"

@interface ModificaPermanenzaViewController ()
@property (nonatomic,strong) IBOutlet UITextField* citta;
@property (nonatomic,strong) IBOutlet UIDatePicker* dataArrivoPicker;
@property (nonatomic,strong) IBOutlet UIDatePicker* dataPartenzaPicker;
@end

@implementation ModificaPermanenzaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Permanenza* p = [self.tappe getAt:_daModificare];
    self.citta.text = p.citta;
    
    //imposto le date dei picker correttamente
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM";
    NSDate* datArr = [dateFormatter dateFromString:p.dataArrivo];
    NSDate* datPar = [dateFormatter dateFromString:p.dataPartenza];
    [self.dataArrivoPicker setDate:datArr];
    [self.dataPartenzaPicker setDate:datPar];
    }
//-------------------------------------------------------------------------
- (void) setDaModificare:(long)input{
    _daModificare = input;
}
//-------------------------------------------------------------------------
// chiamato quando viene premuto il pulsante per salvare le modifiche alla tappa
- (IBAction)onConfermaTapped:(UIButton *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM"];
    NSString *dataArrivoStr = [formatter stringFromDate:self.dataArrivoPicker.date];
    NSString *dataPartenzaStr = [formatter stringFromDate:self.dataPartenzaPicker.date];
    
    Permanenza* ris = [[Permanenza alloc]initWithCitta:[self.citta text]
                                            dataArrivo:dataArrivoStr
                                          dataPartenza:dataPartenzaStr
                                              location:[[CityPoi alloc]initWithName:self.citta.text /*latitude:44.801700 longitude:10.328012*/]];
    
    [self.tappe editTappa:_daModificare with:ris];
    
    // tolgo la view dallo stack
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    [navigationArray removeLastObject];  // You can pass your index here
    self.navigationController.viewControllers = navigationArray;
}

@end
