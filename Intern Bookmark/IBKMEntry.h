//
//  IBKMEntry.h
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBKMEntry : NSObject

@property (nonatomic, readonly) NSNumber *entryID;
@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSDate *created;
@property (nonatomic, readonly) NSDate *updated;

- (instancetype)initWithJSONDictionary:(NSDictionary *)json;

- (instancetype)initWithEntryID:(NSNumber *)entryID URL:(NSURL *)URL title:(NSString *)title created:(NSDate *)created updated:(NSDate *)updated;

@end
