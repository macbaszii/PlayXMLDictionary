//
//  BlognoneServices.m
//  PlayXMLDictionary
//
//  Created by Kiattisak Anoochitarom on 6/11/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "BlognoneServices.h"

@implementation BlognoneServices
@synthesize blognoneData;

+ (id)shareBlognoneServices {
    static dispatch_once_t once;
    static id shareBlognoneServices;
    dispatch_once(&once, ^{
        shareBlognoneServices = [[self alloc] init];
    });
    return shareBlognoneServices;
}

- (id)init {
    if (!(self = [super init])) {
        return nil;
    }
    
    self.blognoneData = [[NSDictionary alloc] init];
    
    return self;
}

- (id)getBlognoneData {
    NSURL *contentURL = [NSURL URLWithString:@"http://www.blognone.com/atom.xml"];
    NSData *contentData = [NSData dataWithContentsOfURL:contentURL];
    
    self.blognoneData = [NSDictionary dictionaryWithXMLData:contentData];
    return self.blognoneData;
}

@end
