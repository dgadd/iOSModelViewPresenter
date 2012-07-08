#import "FakeBookStoreRepository.h"


@implementation FakeBookStoreRepository {


}
- (NSArray *)findAllBooks {
    return [NSArray arrayWithObjects:@"Moby Dick",
                                     @"A Tale of Two Cities",
                                     @"Great Expectations",
                                     @"Absalom, Absalom",
                                     @"Cat's Eye",
                                     nil];
}


@end