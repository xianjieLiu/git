//
//  NSString+PPYToolkit.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PPYToolkit)

- (NSString *)md5Hash;
- (NSString *)sha1Hash;
- (NSString *)sha256Hash;

- (BOOL)isNotEmpty;
- (BOOL)isNotBlank;
- (NSString *)trim;
- (BOOL)contains:(NSString *)sub;
- (BOOL)caseInsensitiveContains:(NSString *)substring;
- (NSUInteger)indexOf:(NSString *)sub;
- (NSUInteger)indexOf:(NSString *)sub start:(NSUInteger)start;
- (NSString *)urlEncode;
- (BOOL)isValidRegularExpression:(NSString *)expression;
- (BOOL)isValidEmail;
- (BOOL)isValidPhone;
- (BOOL)isValidPassword;

- (NSData *)UTF8Data;
@end
