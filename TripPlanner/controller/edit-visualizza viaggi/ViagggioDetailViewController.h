#import <UIKit/UIKit.h>
#import "Viaggio.h"

NS_ASSUME_NONNULL_BEGIN

//questa classe fa da datasource per la table view
@interface ViagggioDetailViewController : UIViewController <UITableViewDataSource>{
@private long _numero_viaggio;
}
- (long) NumeroViaggio;
- (void) setNumeroViaggio:(long)val;
@end

NS_ASSUME_NONNULL_END
