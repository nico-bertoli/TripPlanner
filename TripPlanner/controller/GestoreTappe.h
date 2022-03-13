// classe che fornisce le basi per l' inserimento / eliminazione delle tappe
// in una table view

#import <UIKit/UIKit.h>
#import "ListaViaggi.h"
#import "ArrayPermanenzeSpostamenti.h"

NS_ASSUME_NONNULL_BEGIN

@interface GestoreTappe : UITableViewController

@property (nonatomic,strong) ArrayPermanenzeSpostamenti* tappe;
@property (nonatomic,strong)NSString* nomeViaggio;
@property (nonatomic,strong)NSString* descrizione;

@end

NS_ASSUME_NONNULL_END
