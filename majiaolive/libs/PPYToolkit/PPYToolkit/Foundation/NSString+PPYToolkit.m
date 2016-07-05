//
//  NSString+PPYToolkit.m
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import "NSString+PPYToolkit.h"
#import "PPYFoundationToolkit.h"

@implementation NSString (PPYToolkit)
- (BOOL)isNotEmpty {
    return [self length] > 0;
}

- (BOOL)isNotBlank {
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *)md5Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}

- (NSString *)sha1Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1Hash];
}

- (NSString *)sha256Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha256Hash];
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)contains:(NSString *)substring {
    return [self rangeOfString:substring].location != NSNotFound;
}

- (BOOL)caseInsensitiveContains:(NSString *)substring {
    return [[self lowercaseString] rangeOfString:[substring lowercaseString]].location != NSNotFound;
}

- (NSUInteger)indexOf:(NSString *)substring {
    return [self rangeOfString:substring].location;
}

- (NSUInteger)indexOf:(NSString *)sub start:(NSUInteger)start {
    return [self rangeOfString:sub options:NSLiteralSearch range:NSMakeRange(start, [self length] - start)].location;
}

-(NSString *)urlEncode{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    NSInteger sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

- (BOOL)isValidRegularExpression:(NSString *)expression {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidEmail {
    NSString *exp = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}";
    return [self isValidRegularExpression:exp];
}

- (BOOL)isValidPassword
{
    NSString *exp = @"^[a-zA-Z0-9]{6,20}+$";
    return [self isValidRegularExpression:exp];
}

- (BOOL)isValidPhone {
    NSString *text = self;
    NSCharacterSet *chset = [NSCharacterSet characterSetWithCharactersInString:@"+-()"];
    NSRange range = [text rangeOfCharacterFromSet:chset];
    while (range.location != NSNotFound) {
        text = [text stringByReplacingCharactersInRange:range withString:@""];
        range = [text rangeOfCharacterFromSet:chset];
    }
    NSString *exp = @"[0-9]{7,20}";
    return [text isValidRegularExpression:exp];
}

- (NSData *)UTF8Data
{
    return [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}

@end
