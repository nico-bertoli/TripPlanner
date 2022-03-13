// controller di una cella di tipo tappa

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TappaTableViewCell : UITableViewCell{
    @public long cellNumber;
}

@property (strong, nonatomic) IBOutlet UILabel *citta;
@property (nonatomic,strong) IBOutlet UILabel* date;
@property (nonatomic,strong) IBOutlet UIImageView* immagine;
@property (nonatomic,strong) IBOutlet UIButton* delButton;
@end

NS_ASSUME_NONNULL_END
