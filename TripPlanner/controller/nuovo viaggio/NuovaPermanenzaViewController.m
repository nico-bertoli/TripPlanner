#import "NuovaPermanenzaViewController.h"
#import "ArrayPermanenzeSpostamenti.h"

@interface NuovaPermanenzaViewController ()

@property (nonatomic,strong) IBOutlet UITextField* citta;
@property (nonatomic,strong) IBOutlet UIDatePicker* dataArrivoPicker;
@property (nonatomic,strong) IBOutlet UIDatePicker* dataPartenzaPicker;
@end

@implementation NuovaPermanenzaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //imposto la data dei picker in modo comodo
    NSString* ultimaData = [self.tappe getDataFine];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM";
    NSDate* dat = [dateFormatter dateFromString:ultimaData];
    [self.dataArrivoPicker setDate:dat];
    [self.dataPartenzaPicker setDate:dat];
    
}

// chiamato quando viene premuto il pulsante per aggiungere la tappa
- (IBAction)onConfermaTapped:(UIButton *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM"];
    NSString *dataArrivoStr = [formatter stringFromDate:self.dataArrivoPicker.date];
    NSString *dataPartenzaStr = [formatter stringFromDate:self.dataPartenzaPicker.date];
    
    Permanenza* ris = [[Permanenza alloc]initWithCitta:[self.citta text]
                                            dataArrivo:dataArrivoStr
                                          dataPartenza:dataPartenzaStr
                                              location:[[CityPoi alloc]initWithName:self.citta.text /*latitude:44.801700 longitude:10.328012*/]];
    [self.tappe addPermanenza:ris];
    
    // tolgo la view dallo stack
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    [navigationArray removeLastObject];  // You can pass your index here
    self.navigationController.viewControllers = navigationArray;
}

@end
