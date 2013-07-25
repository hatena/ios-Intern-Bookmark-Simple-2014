//
//  IBKMInternBookmarkAPIClient.h
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "AFHTTPClient.h"

@interface IBKMInternBookmarkAPIClient : AFHTTPClient

+ (instancetype)sharedClient;

- (void)getBookmarksWithCompletion:(void (^)(NSDictionary *results, NSError *error))block;

@end
