//
//  IBKMUser.m
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMUser.h"

#import "NSDateFormatter+MySQL.h"

@implementation IBKMUser

- (instancetype)initWithJSONDictionary:(NSDictionary *)json
{
    NSNumber *userID = json[@"user_id"];
    NSString *name = json[@"name"];

    NSDateFormatter *dateFormatter = [NSDateFormatter MySQLDateFormatter];
    NSDate *created = [dateFormatter dateFromString:json[@"created"]];

    return [self initWithUserID:userID name:name created:created];
}

- (instancetype)initWithUserID:(NSNumber *)userID name:(NSString *)name created:(NSDate *)created
{
    self = [super init];
    if (self) {
        _userID = userID;
        _name = name;
        _created = created;
    }

    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.userID=%@", self.userID];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.created=%@", self.created];
    [description appendString:@">"];
    return description;
}

@end
