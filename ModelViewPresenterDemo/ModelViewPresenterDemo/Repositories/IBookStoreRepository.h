@protocol IBookStoreRepository <NSObject>

@required
-(NSArray *)findAllBooks;
@end