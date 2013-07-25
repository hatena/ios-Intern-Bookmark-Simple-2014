//
//  IBKMBookmark.h
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBKMEntry;
@class IBKMUser;

@interface IBKMBookmark : NSObject

@property (nonatomic, readonly) NSNumber *bookmarkID;
@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) IBKMEntry *entry;
@property (nonatomic, readonly) IBKMUser *user;
@property (nonatomic, readonly) NSDate *created;
@property (nonatomic, readonly) NSDate *updated;

- (instancetype)initWithJSONDictionary:(NSDictionary *)json;

- (instancetype)initWithBookmarkID:(NSNumber *)bookmarkID comment:(NSString *)comment entry:(IBKMEntry *)entry user:(IBKMUser *)user created:(NSDate *)created updated:(NSDate *)updated;

@end
