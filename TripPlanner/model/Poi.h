//classe che memorizza dati relativi alla posizione geografica di una città
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Poi : NSObject

@property double latitude;
@property double longitude;

- (instancetype) initWithLatitude:(double)lat Longitude:(double)lon;

@end

NS_ASSUME_NONNULL_END
