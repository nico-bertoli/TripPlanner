//
//  ViagggioDetailViewController.m
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 15/09/21.
//

#import "ViagggioDetailViewController.h"
#import "Spostamento.h"
#import "EditNomeDescrizioneViewController.h"
#import "TappaTableViewCell.h"
#import "Database.h"
#import "MapViewController.h"

@interface ViagggioDetailViewController ()

@property (nonatomic,strong) Viaggio* viaggio;
@property (weak,nonatomic) IBOutlet UILabel* nomeViaggio;
@property (weak,nonatomic) IBOutlet UILabel* dataInizioFine;
@property (weak,nonatomic) IBOutlet UILabel* descrizione;
@property (weak,nonatomic) IBOutlet UITableView* tableView;

@end

@implementation ViagggioDetailViewController

//---------------------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    //dichiaro di essere io la data source della table View
    self.tableView.dataSource = self;
}

//---------------------------------------------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated{
    // carico dal db il viaggio con il numero che devo gestire
    self.viaggio = [Database getViaggio:_numero_viaggio];
    
    //imposto l' interfaccia in base al viaggio che devo mostrare
    self.nomeViaggio.text = self.viaggio.nome;
    //self.dataInizioFine.text = @"Temp";
    self.dataInizioFine.text = [self.viaggio.tappe getDataInizioFine];
    self.descrizione.text = self.viaggio.descrizione;
    
    [self.tableView reloadData];
}

//---------------------------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viaggio.tappe size];
}

//---------------------------------------------------------------------------------------------------------
//definisco il valore di ciascuna cella in base alla sua posizione
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TappaTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell -> cellNumber = indexPath.row;
    id val = [self.viaggio.tappe getAt:indexPath.row];
    
    if ([val isMemberOfClass:[Spostamento class]]){
        Spostamento* spostamento = (Spostamento*)val;
        cell.citta.text = [NSString stringWithFormat:@"%@ - %@",spostamento.cittPartenza,spostamento.cittDestinazione];
        cell.date.text = [NSString stringWithFormat:@"%@ - %@",spostamento.dataPartenza,spostamento.dataArrivo];
        cell.immagine.image = [UIImage imageNamed: @"viaggio"];
    }
    else{
        Permanenza* permanenza = (Permanenza*)val;
        cell.citta.text = permanenza.citta;
        cell.date.text = [NSString stringWithFormat:@"%@ - %@",permanenza.dataArrivo,permanenza.dataPartenza];
        cell.immagine.image = [UIImage imageNamed: @"posizione"];
    }
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"EditNomeDescSeg"]){
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[EditNomeDescrizioneViewController class]]){
            EditNomeDescrizioneViewController* vc =
            (EditNomeDescrizioneViewController*)segue.destinationViewController;
            //passo un riferiento al viaggio da modificare alla view
            vc.viaggio = self.viaggio;
        }
    }
    
    else if([segue.identifier isEqualToString:@"showMapSeg"]){
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[MapViewController class]]){
            MapViewController* vc = (MapViewController*)segue.destinationViewController;
            //passo un riferiento al viaggio da modificare alla view
            vc.tappe = self.viaggio.tappe;
        }
    }
    
}

- (long) NumeroViaggio{
    return _numero_viaggio;
}
- (void) setNumeroViaggio:(long)val{
    _numero_viaggio = val;
}


@end
