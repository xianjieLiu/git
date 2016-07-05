//
//  NSData+PPYToolkit.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (PPYToolkit)
- (NSData *)md5Digest;
- (NSString *)md5Hash;
- (NSString*)sha1Hash;
- (NSString *)sha256Hash;
- (NSString *)base64String;
- (NSString *)base64StringWithLineLength:(unsigned int)lineLength;
+ (id)dataWithBase64String:(NSString *)string;
@end
