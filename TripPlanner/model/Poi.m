#import "Poi.h"

@implementation Poi
//-----------------------------------------------------------------
- (instancetype) initWithLatitude:(double)lat Longitude:(double)lon{
    if(self = [super init]){
        _latitude = lat;
        _longitude = lon;
    }
    return self;
}
//-----------------------------------------------------------------
@end
