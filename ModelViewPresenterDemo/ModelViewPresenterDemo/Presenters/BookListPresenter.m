#import "BookListPresenter.h"
#import "IDisplayBooksView.h"
#import "IBookStoreRepository.h"


@implementation BookListPresenter {

@private
    id <IBookStoreRepository> _bookStoreRepository;
}
@synthesize displayBooksView = _displayBooksView;
@synthesize bookStoreRepository = _bookStoreRepository;


- (BookListPresenter *)initWithBookStoreRepository:(id <IBookStoreRepository>)bookStoreRepository andDisplayBooksView:(id <IDisplayBooksView>)displayBooksView {
    if (self = [super init]) {
        _bookStoreRepository = bookStoreRepository;
        _displayBooksView = displayBooksView;
    }

    return self;
}

- (void)displayBooksFromBookstore {
    NSArray *const books = [_bookStoreRepository findAllBooks];
    [_displayBooksView displayBooks:books];
}
@end