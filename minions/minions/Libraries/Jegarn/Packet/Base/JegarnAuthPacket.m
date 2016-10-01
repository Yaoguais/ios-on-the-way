//
// Created by Yao Guai on 16/10/1.
// Copyright (c) 2016 minions.jegarn.com. All rights reserved.
//

#import "JegarnAuthPacket.h"
#import "JegarnAuthPacketContent.h"


@implementation JegarnAuthPacket

- (instancetype)init {
    self = [super init];
    if (self) {
        _from = @"0";
        [self setToSystemUser];
        self.type = [JegarnAuthPacket packetType];
        self.content = [[JegarnAuthPacketContent alloc] init];
    }

    return self;
}

- (NSMutableDictionary *)convertToDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"from"] = self.from;
    dict[@"to"] = self.to;
    dict[@"type"] = self.type;
    dict[@"content"] = @{
            @"uid" : self.content.uid,
            @"account" : self.content.account,
            @"password" : self.content.password,
            @"status" : (id) self.content.status,
    };
    return dict;
}


+ (NSString *)packetType {
    return @"auth";
}

@end