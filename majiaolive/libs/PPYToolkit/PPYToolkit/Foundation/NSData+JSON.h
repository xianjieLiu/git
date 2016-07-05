//
//  NSData+JSON.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JSON)

- (id)JSONObject;
+ (instancetype)dataWithJSONObject:(id)object;

@end
