#import "DisplayBooksTableViewController.h"
#import "IBookStoreRepository.h"
#import "FakeBookStoreRepository.h"


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

- (id)initWithBookStoreRepository:(id <IBookStoreRepository>)bookStoreRepository andDisplayBooksView:(id <IDisplayBooksView>)displayBooksView {
    if (self = [super init]) {
        _bookStoreRepository = bookStoreRepository;
        _displayBooksView = displayBooksView;
    }

    return self;
}

- (void)displayBooks:(NSArray *)books {
    _books = books;
}

- (void)displayBooksFromBookstore {
    NSArray *const books = [_bookStoreRepository findAllBooks];
    [_displayBooksView displayBooks:books];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayBooksFromBookstore];
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


@end
