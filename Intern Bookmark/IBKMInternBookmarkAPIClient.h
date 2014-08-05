//
//  IBKMInternBookmarkAPIClient.h
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol IBKMInternBookmarkAPIClientDelegate;

@interface IBKMInternBookmarkAPIClient : AFHTTPSessionManager

@property (nonatomic, weak) id <NSObject, IBKMInternBookmarkAPIClientDelegate> delegate;

+ (instancetype)sharedClient;
+ (NSURL *)loginURL;

- (void)getBookmarksWithCompletion:(void (^)(NSDictionary *results, NSError *error))block;

@end

@protocol IBKMInternBookmarkAPIClientDelegate

- (void)APIClientNeedsLogin:(IBKMInternBookmarkAPIClient *)client;

@end
