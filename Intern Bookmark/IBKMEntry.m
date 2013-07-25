//
//  IBKMEntry.m
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMEntry.h"

#import "NSDateFormatter+MySQL.h"

@implementation IBKMEntry

- (instancetype)initWithJSONDictionary:(NSDictionary *)json
{
    NSNumber *entryID = json[@"entry_id"];
    NSURL *URL = [NSURL URLWithString:json[@"url"]];
    NSString *title = json[@"title"];

    NSDateFormatter *dateFormatter = [NSDateFormatter MySQLDateFormatter];

    NSDate *created = [dateFormatter dateFromString:json[@"created"]];
    NSDate *updated = [dateFormatter dateFromString:json[@"updated"]];
    
    return [self initWithEntryID:entryID URL:URL title:title created:created updated:updated];
}

- (instancetype)initWithEntryID:(NSNumber *)entryID URL:(NSURL *)URL title:(NSString *)title created:(NSDate *)created updated:(NSDate *)updated
{
    self = [super init];
    if (self) {
        _entryID = entryID;
        _URL = URL;
        _title = title;
        _created = created;
        _updated = updated;
    }

    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.entryID=%@", self.entryID];
    [description appendFormat:@", self.URL=%@", self.URL];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.created=%@", self.created];
    [description appendFormat:@", self.updated=%@", self.updated];
    [description appendString:@">"];
    return description;
}

@end
