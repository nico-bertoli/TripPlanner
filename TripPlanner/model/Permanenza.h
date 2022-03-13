#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "CityPoi.h"

NS_ASSUME_NONNULL_BEGIN

@interface Permanenza : NSObject <MKAnnotation>

@property (nonatomic,strong) NSString* citta;
@property (nonatomic,strong) NSString* dataArrivo;
@property (nonatomic,strong) NSString* dataPartenza;
@property (nonatomic,strong) CityPoi* poi;

-(instancetype) initWithCitta:(NSString*) citta
                dataArrivo:(NSString*) dataArrivo
                dataPartenza:(NSString*) dataPartenza
                     location: (CityPoi*) poi;

@end

NS_ASSUME_NONNULL_END
