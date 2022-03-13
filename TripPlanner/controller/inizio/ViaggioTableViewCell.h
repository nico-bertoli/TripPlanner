//
//  ViaggioTableViewCell.h
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 21/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViaggioTableViewCell : UITableViewCell{
    @private long cellNumber;
}
// label dell' interfaccia grafica
@property (strong, nonatomic) IBOutlet UILabel *nomeViaggio;
@property (nonatomic,strong) IBOutlet UILabel* date;

// definisco manualmente getter e setter perchè il mio cell number è un long
// e con le properties si possono definire solo oggetti
- (long) cellNumber;
- (void) setCellNumber:(long)input;

@end

NS_ASSUME_NONNULL_END
