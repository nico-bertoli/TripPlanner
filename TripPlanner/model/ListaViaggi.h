#import <Foundation/Foundation.h>
#import "Viaggio.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListaViaggi : NSObject
- (NSArray*) getAll;
- (void) add : (Viaggio*) viaggio;
- (Viaggio*) getAt:(NSInteger) index;
- (long) size;
- (void) log;
- (void) delAt:(NSInteger) index;
- (ListaViaggi*) getCopy;

@end

NS_ASSUME_NONNULL_END
