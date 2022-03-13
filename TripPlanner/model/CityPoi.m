#import <MapKit/MapKit.h>
#import "CityPoi.h"

@implementation CityPoi

- (instancetype) initWithName:(NSString *)cityName{
    if(self = [super init]){

//        cityName = [cityName copy];
        _cityName = cityName;

        //in base al nome della mia città, utilizzo il geocoding per trovare le sue coordinate
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        //ottengo l' elenco delle coordintate di citta aventi come nome 'nome'
        [geocoder geocodeAddressString:cityName
        completionHandler:^(NSArray* placemarks, NSError* error){

            //se ne è stata trovata almeno una, imposto come coordinate le prime dell' elenco
             if (placemarks && placemarks.count > 0) {
                 CLPlacemark *topResult = [placemarks objectAtIndex:0];
                 self.latitude = topResult.location.coordinate.latitude;
                 self.longitude = topResult.location.coordinate.longitude;
                     }
         }];
    }
    return self;
}
@end



//@implementation CityPoi

//- (instancetype) initWithName:(NSString *)cityName{
//
//    __block double lat;
//    __block double lon;
//
//    //in base al nome della mia città, utilizzo il geocoding per trovare le sue coordinate
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    //ottengo l' elenco delle coordintate di citta aventi come nome 'nome'
//    [geocoder geocodeAddressString:cityName
//    completionHandler:^(NSArray* placemarks, NSError* error){
//
//        //se ne è stata trovata almeno una, imposto come coordinate le prime dell' elenco
//         if (placemarks && placemarks.count > 0) {
//             CLPlacemark *topResult = [placemarks objectAtIndex:0];
//             lat = topResult.location.coordinate.latitude;
//             lon = topResult.location.coordinate.longitude;
//                 }
//     }];
//
//    if(self = [super initWithLatitude:lat Longitude:lon]){
//        _cityName = cityName;
//    }
//    return self;
//}
//
//@end
