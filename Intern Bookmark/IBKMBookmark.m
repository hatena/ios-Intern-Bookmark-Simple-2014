//
//  IBKMBookmark.m
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMBookmark.h"

#import "NSDateFormatter+MySQL.h"

#import "IBKMEntry.h"
#import "IBKMUser.h"

@implementation IBKMBookmark

- (instancetype)initWithJSONDictionary:(NSDictionary *)json
{
    NSNumber *bookmarkID = json[@"bookmark_id"];
    NSString *comment = json[@"comment"];

    NSDateFormatter *dateFormatter = [NSDateFormatter MySQLDateFormatter];

    NSDate *created = [dateFormatter dateFromString:json[@"created"]];
    NSDate *updated = [dateFormatter dateFromString:json[@"updated"]];

    NSDictionary *entryDictionary = json[@"entry"];
    IBKMEntry *entry = [[IBKMEntry alloc] initWithJSONDictionary:entryDictionary];

    NSDictionary *userDictionary = json[@"user"];
    IBKMUser *user = [[IBKMUser alloc] initWithJSONDictionary:userDictionary];

    return [self initWithBookmarkID:bookmarkID comment:comment entry:entry user:user created:created updated:updated];
}

- (instancetype)initWithBookmarkID:(NSNumber *)bookmarkID comment:(NSString *)comment entry:(IBKMEntry *)entry user:(IBKMUser *)user created:(NSDate *)created updated:(NSDate *)updated
{
    self = [super init];
    if (self) {
        _bookmarkID = bookmarkID;
        _comment = comment;
        _entry = entry;
        _user = user;
        _created = created;
        _updated = updated;
    }

    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.bookmarkID=%@", self.bookmarkID];
    [description appendFormat:@", self.comment=%@", self.comment];
    [description appendFormat:@", self.entry=%@", self.entry];
    [description appendFormat:@", self.user=%@", self.user];
    [description appendFormat:@", self.created=%@", self.created];
    [description appendFormat:@", self.updated=%@", self.updated];
    [description appendString:@">"];
    return description;
}

@end

