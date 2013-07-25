//
//  IBKMBookmarkManager.h
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBKMBookmark;

@interface IBKMBookmarkManager : NSObject

@property (nonatomic, readonly) NSArray *bookmarks;

+ (IBKMBookmarkManager *)sharedManager;

- (void)reloadBookmarksWithBlock:(void (^)(NSError *error))block;

@end
