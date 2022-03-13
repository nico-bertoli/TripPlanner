#import "ListaViaggi.h"

@interface ListaViaggi()
    @property (nonatomic,strong) NSMutableArray* list;
@end

@implementation ListaViaggi

- (instancetype) init {
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}
//---------------------------------------------------
- (NSArray*) getAll{
    return self.list;
}
//---------------------------------------------------
- (void) add:(Viaggio*)viaggio{
    [self.list addObject:viaggio];
}
//---------------------------------------------------
-(Viaggio*) getAt:(NSInteger) index{
    return [self.list objectAtIndex:index];
}
//---------------------------------------------------
- (long) size{
    return self.list.count;
}
//---------------------------------------------------
- (void) log{
    for(int i=0;i<[self size];i++){
        [[self.list objectAtIndex:i]log];
    }
}
//---------------------------------------------------
- (void)delAt:(NSInteger)index{
    if(index< _list.count && index >=0)
        [self.list removeObjectAtIndex:index];
}
//---------------------------------------------------
- (ListaViaggi*) getCopy{
    ListaViaggi* ris = [[ListaViaggi alloc] init];
    for(int i = 0;i<[self size];i++){
        [ris add:[[self getAt:i]getCopy]];
    }
    return ris;
}

@end
