//
//  ESNetworkRestfulOperaton.m
//  Network
//
//  Created by Element on 2014. 6. 9..
//  Copyright (c) 2014년 Reveal. All rights reserved.
//

#import "ESNetworkRestfulOperaton.h"

@implementation ESNetworkRestfulOperaton

-(id)init {
    if (self = [super init]) {
        
        self.retryCount = 0;
        self.response = nil;
        self.error = nil;

    }
    return self;
}

-(void)main {
    self.response = nil;
    self.error = nil;
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSURL *url = [[NSURL alloc] initWithString:self.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    
    NSData *ret = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (ret != nil) {
        NSError *jsonError = nil;
        NSObject *retDic = [NSJSONSerialization JSONObjectWithData:ret options:NSJSONReadingMutableContainers error:&jsonError];
        
        if (jsonError == nil && retDic != nil && ([retDic isKindOfClass:[NSDictionary class]] || [retDic isKindOfClass:[NSArray class]])) {
            self.result = retDic;
        } else {
            self.result = ret;
        }
    }
    
    self.response = response;
    self.error = error;
    self.retryCount++;
    
    [self.manager performSelectorOnMainThread:self.action withObject:self waitUntilDone:NO];

}

@end
