//
//  ArrayPermanenzeSpostamenti.h
//  TripPlanner
//
//  Created by Nicolo' Bertoli on 17/09/21.
//

#import <Foundation/Foundation.h>
#import "Permanenza.h"
#import "Spostamento.h"

NS_ASSUME_NONNULL_BEGIN

//array che memorizza le tappe di un viaggio
@interface ArrayPermanenzeSpostamenti : NSObject

- (NSArray*) getAll;
- (void) addPermanenza : (Permanenza*) permanenza;
- (id) getAt:(NSInteger) index;
- (long) size;
- (void) log;
- (void) delAt:(NSInteger) index;
- (void) delTappa:(NSInteger)index;
- (void) editTappa:(NSInteger)index with:(Permanenza*)permanenza;

-(ArrayPermanenzeSpostamenti*) getCopy;

- (NSString*) getDataInizio;
- (NSString*) getDataFine;
- (NSString*) getDataInizioFine;

@end

NS_ASSUME_NONNULL_END
