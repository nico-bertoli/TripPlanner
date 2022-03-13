#import "Viaggio.h"

@implementation Viaggio
//---------------------------------------------------
-(instancetype) initWithNome:(NSString*) nome
                descrizione:(NSString*) descrizione
                tappe:(nonnull ArrayPermanenzeSpostamenti*)tappe
                         key:(long)key{
    if(self = [super init]){
        _nome = nome;
        _descrizione = descrizione;
        _tappe = [tappe getCopy];
        _key=key;
    }
    return self;
}
//---------------------------------------------------
- (void) log{
    NSLog(@"nome: %@, descrizione: %@",self.nome, self.descrizione);
}
//---------------------------------------------------
- (void) setTappe:(nonnull ArrayPermanenzeSpostamenti*)nuoveTappe{
    _tappe = nuoveTappe;//?? property crasha
}
//---------------------------------------------------
- (Viaggio*) getCopy{
    Viaggio* ris = [[Viaggio alloc] initWithNome:self.nome descrizione:self.descrizione tappe:[self.tappe getCopy] key:_key];
    return ris;
}
//---------------------------------------------------
- (void)setKey:(long)val{
    _key = val;
}
//---------------------------------------------------
- (long)key{
    return _key;
}
//---------------------------------------------------
@end
