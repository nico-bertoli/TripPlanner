//
//  MapViewController.h
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 23/09/21.
//

#import <UIKit/UIKit.h>
#import "ArrayPermanenzeSpostamenti.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic,strong) ArrayPermanenzeSpostamenti* tappe;

@end

NS_ASSUME_NONNULL_END
