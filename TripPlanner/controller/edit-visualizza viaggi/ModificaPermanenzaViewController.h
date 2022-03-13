//
//  ModificaPermanenzaViewController.h
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 23/11/21.
//

#import <UIKit/UIKit.h>
#import "ArrayPermanenzeSpostamenti.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModificaPermanenzaViewController : UIViewController{
@private long _daModificare;
}
@property (nonatomic,strong) ArrayPermanenzeSpostamenti* tappe;
- (void) setDaModificare:(long)input;
@end

NS_ASSUME_NONNULL_END
