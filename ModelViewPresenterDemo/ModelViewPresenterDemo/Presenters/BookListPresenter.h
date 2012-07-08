#import <Foundation/Foundation.h>

@protocol IDisplayBooksView;
@protocol IBookStoreRepository;


@interface BookListPresenter : NSObject
@property(nonatomic, strong) id<IDisplayBooksView> displayBooksView;
@property(nonatomic, strong) id<IBookStoreRepository> bookStoreRepository;

- (BookListPresenter *)initWithBookStoreRepository:(id <IBookStoreRepository>)bookStoreRepository andDisplayBooksView:(id <IDisplayBooksView>)displayBooksView;

- (void)displayBooksFromBookstore;
@end