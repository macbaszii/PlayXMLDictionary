//
//  BlognoneServices.h
//  PlayXMLDictionary
//
//  Created by Kiattisak Anoochitarom on 6/11/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDictionary.h"

@interface BlognoneServices : NSObject

@property (nonatomic, strong) NSDictionary *blognoneData;

+ (id)shareBlognoneServices;
- (id)getBlognoneData;

@end
