#import "EditNomeDescrizioneViewController.h"
#import "EditTappeTableViewController.h"

@interface EditNomeDescrizioneViewController ()
@property (nonatomic,strong) IBOutlet UITextField* nomeViaggio;
@property (nonatomic,strong) IBOutlet UITextField* descrizione;
@end

@implementation EditNomeDescrizioneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nomeViaggio.text = self.viaggio.nome;
    self.descrizione.text = self.viaggio.descrizione;
}

//---------------------------------------------------------------------------------------------

#pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     //gestisco la segue chiamata cosi
     if([segue.identifier isEqualToString:@"EditTappeSeg"]){
         //ottengo un riferimento al view controller a cui mi porta la segue
         if([segue.destinationViewController isKindOfClass:[EditTappeTableViewController class]]){
             EditTappeTableViewController* vc =
             (EditTappeTableViewController*)segue.destinationViewController;
             vc.nomeViaggio = self.nomeViaggio.text;
             vc.descrizione = self.descrizione.text;
             vc.viaggio = self.viaggio;
         }
     }
 }

@end
