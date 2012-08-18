#import "IDisplayBooksView.h"

@protocol IBookStoreRepository;

@interface DisplayBooksTableViewController : UITableViewController  <IDisplayBooksView>

@property(nonatomic, strong) id<IDisplayBooksView> displayBooksView;
@property(nonatomic, strong) id<IBookStoreRepository> bookStoreRepository;
@property(nonatomic, strong) NSArray *books;

- (DisplayBooksTableViewController *)initWithBookStoreRepository:(id)bookStoreRepository andDisplayBooksView:(id)displayBooksView;

- (void)displayBooksFromBookstore;

@end
