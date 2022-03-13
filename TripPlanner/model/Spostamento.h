#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Spostamento : NSObject

@property (nonatomic,strong) NSString* cittPartenza;
@property (nonatomic,strong) NSString* cittDestinazione;
@property (nonatomic,strong) NSString* dataPartenza;
@property (nonatomic,strong) NSString* dataArrivo;

-(instancetype) initWithCittPartenza:(NSString*)cittPartenza
                CittDestinazione:(NSString*) cittDestinazione
                dataPartenza:(NSString*) dataPartenza
                dataArrivo:(NSString*) dataArrivo;

-(void) copiaSpost:(Spostamento*) daCopiare;

@end

NS_ASSUME_NONNULL_END
