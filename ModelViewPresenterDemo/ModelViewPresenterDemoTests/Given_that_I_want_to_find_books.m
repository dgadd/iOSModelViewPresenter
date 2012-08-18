#import "Given_that_I_want_to_find_books.h"
#import "BookListPresenter.h"
#import "OCMockObject.h"
#import "IDisplayBooksView.h"
#import "OCMockRecorder.h"
#import "IBookStoreRepository.h"
#import "FakeBookStoreRepository.h"

@implementation Given_that_I_want_to_find_books

- (void)setUp {
    [super setUp];
}

- (void)test_when_I_ask_to_display_books_from_bookstore_then_repository_finds_and_returns_all_books {
    NSArray* books = [NSArray arrayWithObjects:@"Moby Dick", @"The Grapes of Wrath", @"Tale of Two Cities", nil];

    id bookStoreRepository = [OCMockObject mockForProtocol:@protocol(IBookStoreRepository)];
    [[[bookStoreRepository expect] andReturn:books] findAllBooks];

    id displayBooksView = [OCMockObject mockForProtocol:@protocol(IDisplayBooksView)];
    [[displayBooksView expect] displayBooks:books];

    sut = [[BookListPresenter alloc] initWithBookStoreRepository:bookStoreRepository andDisplayBooksView:displayBooksView];
    [sut displayBooksFromBookstore];


    [bookStoreRepository verify];
    [displayBooksView verify];
}

- (void)test_when_the_repository_is_called_to_find_all_books_then_the_expected_set_is_returned {
    NSArray*expectedBooks = [NSArray arrayWithObjects:@"Moby Dick",
                                         @"A Tale of Two Cities",
                                         @"Great Expectations",
                                         @"Absalom, Absalom",
                                         @"Cat's Eye",
                                         nil];

    id<IBookStoreRepository> bookStoreRepository = [[FakeBookStoreRepository alloc] init];
    NSArray *const booksReturned = [bookStoreRepository findAllBooks];

    STAssertEqualObjects(expectedBooks, booksReturned, @"The books returned should match expected.");
}
@end
