//
//  EditTappeTableViewController.h
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 21/09/21.
//

#import <UIKit/UIKit.h>
#import "GestoreTappe.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditTappeTableViewController : GestoreTappe
@property (nonatomic,strong) Viaggio* viaggio;
@end

NS_ASSUME_NONNULL_END
