#import "ViaggioTableViewCell.h"
#import "Database.h"

@implementation ViaggioTableViewCell

//-----------------------------------------------------------------------------------------------

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//-----------------------------------------------------------------------------------------------

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-----------------------------------------------------------------------------------------------
//  quando viene premuto il pulsante dell della cella, vado ad eliminare il relativo
//  viaggio dal db
- (IBAction)onDelTapped:(UIButton *)sender {
    [Database delViaggioWithIndex:cellNumber];
}

//-----------------------------------------------------------------------------------------------

- (long) cellNumber{
    return cellNumber;
}

//-----------------------------------------------------------------------------------------------

- (void) setCellNumber:(long)input{
    cellNumber = input;
}

@end
