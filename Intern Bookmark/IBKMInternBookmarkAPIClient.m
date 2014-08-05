//
//  IBKMInternBookmarkAPIClient.m
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMInternBookmarkAPIClient.h"

static NSString * const kIBKMInternBookmarkAPIBaseURLString = @"http://localhost:3000/";

@interface IBKMInternBookmarkAPIClient()

@property (nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation IBKMInternBookmarkAPIClient

+ (instancetype)sharedClient
{
    static IBKMInternBookmarkAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });

    return _sharedClient;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPAdditionalHeaders = @{
            @"Accept" : @"application/json",
        };

        self.sessionManager = [[AFHTTPSessionManager alloc]
                         initWithBaseURL:[NSURL URLWithString:kIBKMInternBookmarkAPIBaseURLString]
                         sessionConfiguration:configuration];
    }

    return self;
}

+ (NSURL *)loginURL
{
    return [[NSURL URLWithString:kIBKMInternBookmarkAPIBaseURLString] URLByAppendingPathComponent:@"login"];
}


- (void)getBookmarksWithCompletion:(void (^)(NSDictionary *results, NSError *error))block
{
    [self.sessionManager GET:@"/api/bookmarks"
       parameters:@{}
          success:^(NSURLSessionDataTask *task, id responseObject) {
              if (block) block(responseObject, nil);
          }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              // 401 が返ったときログインが必要.
              if (((NSHTTPURLResponse *)task.response).statusCode == 401 && [self needsLogin]) {
                  if (block) block(nil, nil);
              }
              else {
                  if (block) block(nil, error);
              }
          }];
}

- (BOOL)needsLogin
{
    BOOL delegated = [self.delegate respondsToSelector:@selector(APIClientNeedsLogin:)];
    if (delegated) {
        [self.delegate APIClientNeedsLogin:self];
    }
    return delegated;
}

@end
