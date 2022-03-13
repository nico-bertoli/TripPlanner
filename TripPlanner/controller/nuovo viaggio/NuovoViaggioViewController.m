//
//  NuovoViaggioViewController.m
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 16/09/21.
//

#import "NuovoViaggioViewController.h"
#import "NuoveTappeTableViewController.h"

// in questo modo rendo le property private
@interface NuovoViaggioViewController ()
@property (nonatomic,strong) IBOutlet UITextField* nomeViaggio;
@property (nonatomic,strong) IBOutlet UITextField* descrizione;
@end

@implementation NuovoViaggioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//-----------------------------------------------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"NuoveTappeSeg"]){
        //ottengo un riferimento al view controller a cui mi porta la segue
        if([segue.destinationViewController isKindOfClass:[NuoveTappeTableViewController class]]){
            
            //imposto come nome e descrizione del viaggio quelli impostati
            NuoveTappeTableViewController* vc =
            (NuoveTappeTableViewController*)segue.destinationViewController;
            vc.nomeViaggio = self.nomeViaggio.text;
            vc.descrizione = self.descrizione.text;
        }
    }
}


@end
