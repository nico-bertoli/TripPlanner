#import "GestoreTappe.h"
#import "Database.h"
#import "TappaTableViewCell.h"
#import "NuovaPermanenzaViewController.h"
#import "ModificaPermanenzaViewController.h"

@implementation GestoreTappe
//---------------------------------------------------------------------------------------------------------
// quando viene premuto il pulsante "del" sulle celle, esse inviano una notifica a questa
// classe, che le deve andare ad eliminare
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //mi registro presso il notification center
    [[NSNotificationCenter defaultCenter]
                                            // oggetto che aspetta le notifiche
                                            addObserver:self
                                            // metodo da eseguire all' arrivo di una notifica
                                            selector:@selector(deleteCell:)
                                            // nome della notifica
                                            name:@"dellCellNotif"
                                            // oggetto che genera la notifica
                                            object:nil];
}

//---------------------------------------------------------------------------------------------------------
// metodo eseguito quando viene ricevuta la notifica "del premuto su una cella"
// elimino la cella che ha generato la notifica
- (void)deleteCell:(NSNotification*)notification{
    //estraggo dalla notifica il numero della cella da eliminare
    int number = [[notification.userInfo objectForKey:@"cell_number"]intValue];
    
    [self.tappe delTappa:number];
    
    [self.tableView reloadData];
}

//---------------------------------------------------------------------------------------------------------
// dato che l' utente aggiunge tappe da un' altra view, ogni volta che questa view
// viene visualizzata devo ricaricare i dati dal database, in modo da mostrare un' interfaccia aggiornata
- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

//---------------------------------------------------------------------------------------------------------
// ho una sola section nella mia table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//--------------------------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tappe size];
}
//--------------------------------------------------------------------------------------------------
// restituisce la cella inizializzata im modo coerente con il model per un certo indexpath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // ottengo un riferimento alla tappa
    TappaTableViewCell* cell = (TappaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellaTappa" forIndexPath:indexPath];
    //imposto come numero della cella quello corretto
    cell->cellNumber = indexPath.row;
    
    // ottengo la permanenza/spostamento da impostare nella cella
    id elemLista = [self.tappe getAt:indexPath.row];
    
    //imposto i valori della cella in modo opportuno
    if ([elemLista isMemberOfClass:[Spostamento class]]){
        Spostamento* spostamento = (Spostamento*)elemLista;
        cell.citta.text = [NSString stringWithFormat:@"%@ - %@",spostamento.cittPartenza,spostamento.cittDestinazione];
        cell.date.text = [NSString stringWithFormat:@"%@ - %@",spostamento.dataPartenza,spostamento.dataArrivo];
        cell.immagine.image = [UIImage imageNamed: @"viaggio"];
        [cell.delButton setHidden:TRUE];
        //i viaggi non devono essere clicabili, perche' l' utente non li deve
        //poter modificare direttamente
        cell.userInteractionEnabled = NO;
    }
    else{   //caso permanenza
        Permanenza* permanenza = (Permanenza*) elemLista;
        cell.citta.text = permanenza.citta;
        cell.date.text = [NSString stringWithFormat:@"%@ - %@",permanenza.dataArrivo,permanenza.dataPartenza];
        cell.immagine.image = [UIImage imageNamed: @"posizione"];
        [cell.delButton setHidden:FALSE];
        cell.userInteractionEnabled=YES;
    }
    return cell;
}

//---------------------------------------------------------------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //gestisco la segue chiamata cosi
    if([segue.identifier isEqualToString:@"NuovaPermanenenzaSeg"]){
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[NuovaPermanenzaViewController class]]){
            NuovaPermanenzaViewController* vc = (NuovaPermanenzaViewController*)segue.destinationViewController;
            
            //passo alla view per aggiungere una tappa la lista delle tappe
            vc.tappe = self.tappe;
        }
    }
    if([segue.identifier isEqualToString:@"ModificaPermanenzaSeg"]){
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[ModificaPermanenzaViewController class]]){
            ModificaPermanenzaViewController* vc = (ModificaPermanenzaViewController*)segue.destinationViewController;
            //richiedo alla table view di restituirmi l' index path della cella selezionata
            NSIndexPath* indexPath = [self.tableView indexPathForCell:sender];
            vc.tappe = self.tappe;
            //indico la tappa da modificare
            [vc setDaModificare: indexPath.row];
            
        }
    }
}

@end
