#import "ArrayPermanenzeSpostamenti.h"
#import "Permanenza.h"
#import "Spostamento.h"

@interface ArrayPermanenzeSpostamenti ()
//dall' esterno vengono aggiute solo permanenze
- (void) addSpostamento:(Spostamento *)spostamento;
@property (nonatomic,strong)NSMutableArray* vett;
@end

@implementation ArrayPermanenzeSpostamenti
//-----------------------------------------------------
//init inizializza l' array sottostante
- (instancetype) init {
    if(self = [super init]){
        _vett = [[NSMutableArray alloc] init];
    }
    return self;
}
//-----------------------------------------------------
- (NSArray*) getAll{
    return self.vett;
}
//-----------------------------------------------------
- (void) addSpostamento:(Spostamento *)spostamento{
    [self.vett addObject:spostamento];
}
//-----------------------------------------------------
- (void) addPermanenza : (Permanenza*) daAggiungere{

    // se ci sono già altre permanenze nell' array
    if([self size]>0){
        
        //ottengo un riferimento alla permanenza precedente
        Permanenza* prec = [self getAt:[self size]-1];
        
        //calcolo lo spostamento di mezzo
        Spostamento* spost = [[Spostamento alloc] initWithCittPartenza:prec.citta
                                 CittDestinazione:daAggiungere.citta
                                     dataPartenza:prec.dataPartenza
                                       dataArrivo:daAggiungere.dataArrivo];
        //aggiungo lo spostamento di mezzo
        [self addSpostamento:spost];
    }
    //aggiungo la nuova permanenza
    [self.vett addObject:daAggiungere];
}
//-----------------------------------------------------
- (id) getAt:(NSInteger) index{return self.vett [index];}
//-----------------------------------------------------
- (long) size{return self.vett.count;}
//-----------------------------------------------------
//stampa la lista delle tappe attuale sul terminale
- (void) log{
    NSLog(@"lista tappe:");
    for(int i=0;i<[self size];i++){
        id ris = [self.vett objectAtIndex:i];
        if ([ris isMemberOfClass:[Spostamento class]]){
            Spostamento* spostamento = (Spostamento*)ris;
            NSLog(@"%@ - %@",spostamento.cittPartenza,spostamento.cittDestinazione);
        }
        else{
            Permanenza* permanenza = (Permanenza*)ris;
            NSLog(@"%@",permanenza.citta);
        }
    }
}
//-----------------------------------------------------
//ritorna la data iniziale del tour salvato
- (NSString *)getDataInizio{
    //se non ci sono tappe ritorno la stringa vuota
    if(self.vett.count==0)return@"";
    
    NSString* inizio;
    
    //elemeto iniziale
    id iElem = self.vett [0];
    
    //in realtà questo caso non si verifica mai, ma cosi il codice e' piu' sicuro
    if ([iElem isMemberOfClass:[Spostamento class]]){
        Spostamento* spostamento = (Spostamento*)iElem;
        inizio=spostamento.dataPartenza;
    }
    else{
        Permanenza* permanenza = (Permanenza*)iElem;
        inizio = permanenza.dataArrivo;
    }
    return inizio;
}
//-----------------------------------------------------
//ritorna la data finale del tour salvato
- (NSString *)getDataFine{
    //se non ci sono tappe ritorno la stringa vuota
    if(self.vett.count==0)return@"";
    
    NSString* fine;
    
    id iElem = self.vett [self.vett.count-1];
    
    //in realtà questo caso non si verifica mai, ma cosi il codice e' piu' sicuro
    if ([iElem isMemberOfClass:[Spostamento class]]){
        Spostamento* spostamento = (Spostamento*)iElem;
        fine=spostamento.dataArrivo;
    }
    else{
        Permanenza* permanenza = (Permanenza*)iElem;
        fine = permanenza.dataPartenza;
    }
    return fine;
}
//-----------------------------------------------------
//ritorna la "data inziale - data finale" del tour
- (NSString *)getDataInizioFine{
    return [NSString stringWithFormat:@"%@ - %@",self.getDataInizio,self.getDataFine];
}
//-----------------------------------------------------
- (void)delAt:(NSInteger)index{
    if(index<[self size] && index >=0)
        [self.vett removeObjectAtIndex:index];
}
//-----------------------------------------------------
// elimina la tappa a un certo indice
- (void)delTappa:(NSInteger)index{
    if(index>=[self size] || index <0) return;
    
    //se la tappa da eliminare è la prima non faccio nient' altro
    if(index ==0){
        [self delAt:0];
        [self delAt:0];
    }
    //se la tappa da eliminare è l' ultima non faccio nient' altro
    else if(index == [self size]-1){
        [self delAt:[self size]-1];
        [self delAt:[self size]-1];
    }
    // se la tappa da eliminare è in mezzo ad altre, allora devo modificare gli
    // spostamenti in modo da rendere coerente la tabella
    else{
        //elimino la tappa e lo spostamento precedente ad essa
        [self delAt:index-1];
        [self delAt:index-1];

        // modifico lo spostamento da collegare la tappa precedente e la successiva

        //tappa prec ha indice index -2
        //tappa succ ha indice index -1
        Permanenza* prec = (Permanenza*)[self getAt:index-2];
        Permanenza* succ = (Permanenza*)[self getAt:index];

        Spostamento* nuovoSpostamento = [[Spostamento alloc] initWithCittPartenza:prec.citta
                                                                 CittDestinazione:succ.citta
                                                                     dataPartenza:prec.dataPartenza
                                                                       dataArrivo:prec.dataArrivo];

        Spostamento* spost = [self getAt:index-1];
        [spost copiaSpost:nuovoSpostamento];
    }
    
}

//-----------------------------------------------------
// creo una copia dell' oggetto e la restituisco
- (ArrayPermanenzeSpostamenti*) getCopy{
    ArrayPermanenzeSpostamenti* ris = [[ArrayPermanenzeSpostamenti alloc] init];
    
    for(int i=0;i<[self size];i++){
        id next = [self getAt:i];
        if([next isKindOfClass:[Permanenza class]]){
            [ris addPermanenza:next];
        }
    }
    return ris;
}
//-----------------------------------------------------
- (void) editTappa:(NSInteger)index with:(Permanenza*)permanenza{
    
    //modifico la tappa modificata
    Permanenza* p = [self getAt:index];
    long size = [self size];
    
    if(index>=size || index <0) return;
    
    p.citta = permanenza.citta;
    p.dataArrivo = permanenza.dataArrivo;
    p.dataPartenza = permanenza.dataPartenza;
    p.poi = permanenza.poi;
    
    //caso 2 permanenze
    if(size >1){
        //se modifico prima permanenza
        if(index == 0){
            Spostamento* s = [self getAt:index+1];
            s.dataPartenza = permanenza.dataPartenza;
            s.cittPartenza = permanenza.citta;
        }
        //se modifico ultima permanenza
        else if (index == size-1){
            Spostamento* s = [self getAt:index-1];
            s.dataArrivo = permanenza.dataArrivo;
            s.cittDestinazione = permanenza.citta;
        }
        //se modifico permanenza tra altre due permanenze
        else{
            Spostamento* succ = [self getAt:index+1];
            succ.dataPartenza = permanenza.dataPartenza;
            succ.cittPartenza = permanenza.citta;
            Spostamento* prec = [self getAt:index-1];
            prec.dataArrivo = permanenza.dataArrivo;
            prec.cittDestinazione = permanenza.citta;
        }
    }
}


@end
