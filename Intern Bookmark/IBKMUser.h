//
//  IBKMUser.h
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBKMUser : NSObject

@property (nonatomic, readonly) NSNumber *userID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDate *created;

- (instancetype)initWithJSONDictionary:(NSDictionary *)json;

- (instancetype)initWithUserID:(NSNumber *)userID name:(NSString *)name created:(NSDate *)created;

@end
