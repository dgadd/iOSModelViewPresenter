#import "DisplayBooksTableViewController.h"
#import "BookListPresenter.h"
#import "IBookStoreRepository.h"
#import "FakeBookStoreRepository.h"

@interface DisplayBooksTableViewController ()
- (BookListPresenter *)delegateDependencyInjectionToAnIocContainer;


@end

@implementation DisplayBooksTableViewController
@synthesize books = _books;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)displayBooks:(NSArray *)books {
    _books = books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BookListPresenter *presenter = [self delegateDependencyInjectionToAnIocContainer];
    [presenter displayBooksFromBookstore];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"BooksCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell textLabel].text = [_books objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // do nothing
}

- (BookListPresenter *)delegateDependencyInjectionToAnIocContainer {
    id<IBookStoreRepository> bookStoreRepository = [[FakeBookStoreRepository alloc] init];
    BookListPresenter *const presenter = [[BookListPresenter alloc] initWithBookStoreRepository:bookStoreRepository
                                                                            andDisplayBooksView:self];
    return presenter;
}


@end
