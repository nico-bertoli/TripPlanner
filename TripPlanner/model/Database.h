#import <Foundation/Foundation.h>
#import "ListaViaggi.h"

NS_ASSUME_NONNULL_BEGIN

@interface Database : NSObject

+ (ListaViaggi*) getListaViaggi;
+ (void) initDB;
+ (void) addViaggioWithNome:(NSString*)nome
                descrizione:(NSString*)descrizione
                      tappe:(ArrayPermanenzeSpostamenti*)tappe;
+ (void) delViaggioWithIndex:(long)index;
+ (void) replaceViaggioWithIndex:(long)index with:(Viaggio*)v;
+ (void) editViaggioWithIndex:(long)index withNome:(NSString*)nome descrizione:(NSString*)descrizione tappe:(ArrayPermanenzeSpostamenti*)tappe;
+ (Viaggio*) getViaggio:(long)indice;
@end

NS_ASSUME_NONNULL_END
