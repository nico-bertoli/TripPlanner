//
//  MapViewController.m
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 23/09/21.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()

@property (strong, nonatomic) IBOutlet MKMapView* mapView;

//centra la mappa in un certo punto e definisce il livello di zoom
- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom;
@end




@implementation MapViewController

//---------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    // mi registro come delegate della mapView
    self.mapView.delegate = self;
    
    // se non ho tappe centro la mappa su parma
    if([self.tappe size] ==0)
        [self centerMapToLocation:CLLocationCoordinate2DMake(44.801700, 10.328012)
                             zoom:5];
    // altrimenti la centro sulla prima tappa
    else{
        Permanenza* p = [self.tappe getAt:0];
        [self centerMapToLocation:CLLocationCoordinate2DMake(p.poi.latitude, p.poi.longitude)
                              zoom:5];
    }
    //prelevo solo le permanenze dalla lista di tappe, e le aggiungo come annotation alla mappa
    for (int i = 0;i<[self.tappe size];i++){
        id elem = [self.tappe getAt:i];
        if([elem isKindOfClass:[Permanenza class]]){
            [self.mapView addAnnotation:elem];
        }
    }
    
    //voglio mostrare la posizione dell' utente sulla mappa
    self.mapView.showsUserLocation = YES;
}

//---------------------------------------------------------------------------------------------

//definisce lo zoom e la posizione iniziali sulla mappa
- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}

//---------------------------------------------------------------------------------------------

// decido come devono essere visualizzate le mie annotation sulla mappa
// per ogni annotation della mia mappa (per ogni permanenza), voglio creare una annotation view che permetta all' utente di visualizzarla
// questa cosa funziona perchè la mia classe Permanenza è conforme al protocollo MKAnnotation, e puo' restituire le proprie coordinate
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    //provo a ottenere un' annotation view riciclandola
    static NSString *AnnotationIdentifer = @"MapAnnotationView";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifer];
    
    // se non mi viene restituita una vista, allora ne creo una nuova
    if(!annotationView){
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:AnnotationIdentifer];
        //premendo sull' annotation, voglio che venga mostrato il callout (info sulla tappa)
        annotationView.canShowCallout = YES;

    }
    
    annotationView.annotation = annotation;
    return annotationView;
}
@end
