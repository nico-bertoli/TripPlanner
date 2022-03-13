#import "Poi.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityPoi : Poi

@property (nonatomic, strong) NSString *cityName;

- (instancetype) initWithName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
