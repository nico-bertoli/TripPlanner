#import "EditTappeTableViewController.h"
#import "ListaViaggiTableViewController.h"
#import "Database.h"

@implementation EditTappeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tappe = self.viaggio.tappe;
}

//---------------------------------------------------------------------------------------------

- (IBAction)onConfermaTapped:(UIButton *)sender {
    
    [Database editViaggioWithIndex:self.viaggio.key withNome:self.nomeViaggio descrizione:self.descrizione tappe:self.tappe];
    
    // tolgo la view dallo stack
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    [navigationArray removeLastObject];
    [navigationArray removeLastObject];
    self.navigationController.viewControllers = navigationArray;
}

@end
