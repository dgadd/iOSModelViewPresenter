#import "BookListPresenterTests.h"
#import "BookListPresenter.h"
#import "OCMockObject.h"
#import "IDisplayBooksView.h"
#import "OCMockRecorder.h"
#import "IBookStoreRepository.h"
#import "FakeBookStoreRepository.h"

@implementation BookListPresenterTests

- (void)setUp {
    [super setUp];
}

- (void)testMockDisplayBooksFromBookStoreMethod_callToRepositoryToFindAll_booksAreBoundToView {
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

- (void)testDisplayBooksFromBookStoreMethod_callToRepositoryToFindAll_booksAreBoundToView {
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
