// controller di una cella di tipo tappa
#import "TappaTableViewCell.h"

@implementation TappaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

// quando viene premuto il pulstante "del" sulla cella, essa deve inviare una notifica
// al table view controller in modo che esso la elimini
- (IBAction)onDelTapped:(UIButton *)sender {
    // scrivo su un dictionary il mio numero di cella, poi invierò questo dictionary nella notifica
    NSDictionary *info = @{
        @"cell_number": [[NSNumber alloc]initWithInteger:cellNumber]
    };
    // invio una notifica al notification center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dellCellNotif"   // notification name
                                                      object:self                         // notification sender (this object)
                                                      userInfo:info];                       // additional info
}



@end
