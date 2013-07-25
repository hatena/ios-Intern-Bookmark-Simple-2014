//
//  IBKMInternBookmarkAPIClient.m
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMInternBookmarkAPIClient.h"

#import "AFJSONRequestOperation.h"

static NSString * const kIBKMInternBookmarkAPIBaseURLString = @"http://localhost:3000/";

@implementation IBKMInternBookmarkAPIClient

+ (instancetype)sharedClient
{
    static IBKMInternBookmarkAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[IBKMInternBookmarkAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kIBKMInternBookmarkAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)getBookmarksWithCompletion:(void (^)(NSDictionary *results, NSError *error))block
{
    [self getPath:@"/api/bookmarks"
       parameters:@{}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              if (block) block(responseObject, nil);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (block) block(nil, error);
          }];
}

@end
