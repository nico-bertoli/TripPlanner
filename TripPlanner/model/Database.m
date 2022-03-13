#import "Database.h"
#import "ArrayPermanenzeSpostamenti.h"

@implementation Database

static ListaViaggi* viaggi = nil;
// indica la key da dare al prossimo viaggio che verrà aggiunto al db
static long nextKey;

//---------------------------------------------------------------------------------
+ (void) initDB{
    viaggi = [[ListaViaggi alloc] init];
    nextKey = 0;
}
//---------------------------------------------------------------------------------
+ (ListaViaggi*) getListaViaggi{
    return [viaggi getCopy];
}

+ (void) addViaggioWithNome:(NSString*)nome
                descrizione:(NSString*)descrizione
                      tappe:(ArrayPermanenzeSpostamenti*)tappe{
    [viaggi add:[[Viaggio alloc]initWithNome:nome descrizione:descrizione tappe:tappe key:nextKey++]];
}
//---------------------------------------------------------------------------------
+ (void) delViaggioWithIndex:(long)index{
    [viaggi delAt:index];
}
//---------------------------------------------------------------------------------
+ (void) replaceViaggioWithIndex:(long)index with:(Viaggio*)v{
    Viaggio* viaggio = [viaggi getAt:index];
    viaggio.nome=v.nome;
    viaggio.descrizione = v.descrizione;
    viaggio.tappe = [v.tappe getCopy];
}
//---------------------------------------------------------------------------------
+ (void) editViaggioWithIndex:(long)index withNome:(NSString*)nome descrizione:(NSString*)descrizione tappe:(ArrayPermanenzeSpostamenti*)tappe{
    Viaggio* viaggio = [viaggi getAt:index];
    viaggio.nome = nome;
    viaggio.descrizione = descrizione;
    viaggio.tappe = [tappe getCopy];
}
//---------------------------------------------------------------------------------
+ (Viaggio*) getViaggio:(long)indice{
    return [viaggi getAt:indice];
}
@end
