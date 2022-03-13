#import <Foundation/Foundation.h>
#import "ArrayPermanenzeSpostamenti.h"

NS_ASSUME_NONNULL_BEGIN

@interface Viaggio : NSObject{
// numero che identifica il viaggio
@private long _key;
}

@property (nonatomic,strong) NSString* nome;
@property (nonatomic,strong) NSString* descrizione;
@property (nonatomic,strong) ArrayPermanenzeSpostamenti* tappe;

-(instancetype) initWithNome:(NSString*) nome
                descrizione:(NSString*) descrizione
                       tappe:(ArrayPermanenzeSpostamenti*) tappe
                         key:(long)key;
-(void) log;

- (void) setTappe:(ArrayPermanenzeSpostamenti*)nuoveTappe;

- (Viaggio*) getCopy;

- (void)setKey:(long)val;
- (long)key;

@end

NS_ASSUME_NONNULL_END
