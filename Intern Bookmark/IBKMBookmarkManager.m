//
//  IBKMBookmarkManager.m
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMBookmarkManager.h"

#import "IBKMInternBookmarkAPIClient.h"
#import "IBKMBookmark.h"

@interface IBKMBookmarkManager ()

@property (nonatomic) NSArray *bookmarks;

@end

@implementation IBKMBookmarkManager

+ (IBKMBookmarkManager *)sharedManager
{
    static IBKMBookmarkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });

    return _sharedManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.bookmarks = @[];
    }

    return self;
}

- (void)reloadBookmarksWithBlock:(void (^)(NSError *error))block
{
    [[IBKMInternBookmarkAPIClient sharedClient]
         getBookmarksWithCompletion:^(NSDictionary *results, NSError *error) {
             if (results) {
                 NSArray *bookmarksJSON = results[@"bookmarks"];
                 self.bookmarks = [self parseBookmarks:bookmarksJSON];
             }
             if (block) block(error);
         }
     ];
}

- (NSArray *)parseBookmarks:(NSArray *)bookmarks
{
    NSMutableArray *mutableBookmarks = [NSMutableArray array];

    [bookmarks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        IBKMBookmark *bookmark = [[IBKMBookmark alloc] initWithJSONDictionary:obj];
        [mutableBookmarks addObject:bookmark];
    }];

    return [mutableBookmarks copy];
}

@end
