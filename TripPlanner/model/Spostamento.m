#import "Spostamento.h"

@implementation Spostamento
//---------------------------------------------------
-(instancetype) initWithCittPartenza:(NSString*)cittPartenza
                CittDestinazione:(NSString*) cittDestinazione
                dataPartenza:(NSString*) dataPartenza
                dataArrivo:(NSString*) dataArrivo{
    
    if(self = [super init]){
        _cittPartenza = cittPartenza;
        _cittDestinazione = cittDestinazione;
        _dataPartenza = dataPartenza;
        _dataArrivo = dataArrivo;
    }
    return self;
}
//---------------------------------------------------
-(void) copiaSpost:(Spostamento*) daCopiare{
    self.cittPartenza = daCopiare.cittPartenza;
    self.cittDestinazione = daCopiare.cittDestinazione;
    self.dataPartenza = daCopiare.dataPartenza;
    self.dataArrivo = daCopiare.dataArrivo;
}
//---------------------------------------------------
@end
