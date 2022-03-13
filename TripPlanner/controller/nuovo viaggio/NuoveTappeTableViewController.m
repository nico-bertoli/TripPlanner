#import "NuoveTappeTableViewController.h"
#import "Database.h"

@interface NuoveTappeTableViewController ()

@end

@implementation NuoveTappeTableViewController

//--------------------------------------------------------------------------------------------------
// quando viene caricata la view, devo allocare una lista di tappe
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tappe = [[ArrayPermanenzeSpostamenti alloc] init];
}

//--------------------------------------------------------------------------------------------------
// quando viene premuto il pulsante "conferma", salvo il viaggio sul database
- (IBAction)onConfermaTapped:(UIButton *)sender {
    [Database addViaggioWithNome:self.nomeViaggio descrizione:self.descrizione tappe:self.tappe];
    
    //eliminare
//    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
//    [navigationArray removeLastObject];
//    [navigationArray removeLastObject];
//    self.navigationController.viewControllers = navigationArray;
    
    //  torno alla view iniziale
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//--------------------------------------------------------------------------------------------------

@end
