#import "Permanenza.h"

@implementation Permanenza
//---------------------------------------------------
-(instancetype) initWithCitta:(NSString*) citta
                dataArrivo:(NSString*) dataArrivo
                dataPartenza:(NSString*) dataPartenza
                location:(nonnull CityPoi *)poi{
    if(self = [super init]){
        _citta = citta;
        _dataArrivo = dataArrivo;
        _dataPartenza = dataPartenza;
        _poi = poi;
    }
    return self;
}
//---------------------------------------------------
// per essere conforme al protocollo MKAnnotation, devo implementare questo metodo
- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.poi.latitude;
    coordinate.longitude = self.poi.longitude;
    return coordinate;
}
//---------------------------------------------------
- (NSString *)title{
    return self.citta;
}
//---------------------------------------------------
- (NSString *)subtitle{
    return [NSString stringWithFormat:@"%@ - %@",self.dataArrivo,self.dataPartenza];
}
//---------------------------------------------------
@end
