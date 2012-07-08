#import "IDisplayBooksView.h"

@interface DisplayBooksTableViewController : UITableViewController  <IDisplayBooksView>

@property(nonatomic, strong) NSArray *books;
@end
