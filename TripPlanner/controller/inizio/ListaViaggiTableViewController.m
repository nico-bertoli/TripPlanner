#import "ListaViaggiTableViewController.h"
#import "ViagggioDetailViewController.h"
#import "NuovoViaggioViewController.h"
#import "ViaggioTableViewCell.h"
#import "ListaViaggi.h"
#import "Database.h"

@interface ListaViaggiTableViewController()
@property (nonatomic,strong) ListaViaggi* viaggi;
@end

//table view controller = controller specializzato nella gesione di una table view
@implementation ListaViaggiTableViewController

//-------------------------------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //inizializzo il db
    [Database initDB];
    self.viaggi = [Database getListaViaggi];
    
    self.title = @"Viaggi in programma";
}
//-------------------------------------------------------------------------------------------------------

// ogni volta che ritorno a questa view, il db potrebbe essere stato modificato,
// quindi ricarico i viaggi e aggiorno l' interfaccia
- (void)viewWillAppear:(BOOL)animated{
    self.viaggi = [Database getListaViaggi];
    [self.tableView reloadData];
}

//-------------------------------------------------------------------------------------------------------

// *        METODI NECESSARI PER CONFORMARE LA CLASSE AL UITABLEVIEWDATASOURCE PROTOCOL         *

// ho un' unica sezione contenente tutti i viaggi
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//-------------------------------------------------------------------------------------------------------
// numero di righe nella mia table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viaggi size];
}

//-------------------------------------------------------------------------------------------------------
// metodo che determina cosa stampare nella cella avente un diverso indexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //ottengo la ViaggioTableViewCell in questione
    ViaggioTableViewCell* cell = (ViaggioTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellaViaggio" forIndexPath:indexPath];
    
    //  imposto il numero dela cella come = alla sua posizione nella lista
    [cell setCellNumber:indexPath.row];
    
    //  imposto le lable della cella
    Viaggio* viaggio = [_viaggi getAt:indexPath.row];
    cell.nomeViaggio.text = viaggio.nome;
    cell.date.text = [viaggio.tappe getDataInizioFine];
    
    return cell;
    }

//-------------------------------------------------------------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //se l' utente vuole vedere i dettagli di un viaggio
    if([segue.identifier isEqualToString:@"ShowViaggioDetail"]){
        
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[ViagggioDetailViewController class]]){
            ViagggioDetailViewController* vc = (ViagggioDetailViewController*)segue.destinationViewController;
            
            //richiedo alla table view di restituirmi l' index path della cella selezionata
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            //passo alla view successiva il viaggio che deve essere visualizzato
            Viaggio* viaggio = [_viaggi getAt:indexPath.row];
            vc.numeroViaggio = viaggio.key;
        }
    }
}

@end
