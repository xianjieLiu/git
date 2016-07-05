//
//  UIImage+PPYToolkit.m
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "UIImage+PPYToolkit.h"
#import "CGGeometry+PPYUIToolkit.h"

@implementation UIImage (PPYToolkit)
+ (UIImage *)gradientImageWithColors:(NSArray *)_colors locations:(NSArray *)_locations size:(CGSize)size startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(nil, size.width * scale, size.height * scale, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    NSUInteger count = _colors.count;
    
    CGFloat locations[count];
    int i = 0;
    for (NSNumber *location in _locations) locations[i++] = [location floatValue];
    
    CFMutableArrayRef colorArray = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
    for (UIColor *color in _colors) CFArrayAppendValue(colorArray, color.CGColor);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colorArray, locations);
    
    CFRelease(colorArray);
    
    startPoint.x *= size.width;
    startPoint.y *= -1.0 * size.height;
    
    endPoint.x *= size.width;
    endPoint.y *= -1.0 * size.height;
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGContextRelease(context);
    CGImageRelease(imageRef);
    CGColorSpaceRelease(colorSpace);
    
    return image;
    
}

+ (UIImage*) imagewithLayeredImages:(NSArray*) imageArrays size:(CGSize)size{
    //    CGFloat scale = [[UIScreen mainScreen] scale];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(nil, size.width, size.height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    for(UIImage* image in imageArrays){
        CGContextDrawImage(context, rect, image.CGImage);
    }
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGContextRelease(context);
    CGImageRelease(imageRef);
    CGColorSpaceRelease(colorSpace);
    return image;
}

// add the methods to change the image color by GM

- (UIImage *) imageWithTintColor:(UIColor *)tintColor {
    
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor {
    
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (UIImage *)resizeToSize:(CGSize)size
{
    return [self resizeToSize:size contentFillMode:PPYImageContentFillModeScaleToFill scale:self.scale];
}

- (UIImage *)resizeToSize:(CGSize)size contentFillMode:(PPYImageContentFillMode)fillMode
{
    return [self resizeToSize:size contentFillMode:fillMode scale:self.scale];
}

- (UIImage *)resizeToSize:(CGSize)size contentFillMode:(PPYImageContentFillMode)fillMode scale:(CGFloat)scale
{
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    
    CGRect imageRect = {.origin = CGPointZero, .size = size};
    [self drawInRect:imageRect contentFillMode:fillMode clipToBounds:YES];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)grayscaleImage
{
    UIImage *sourceImage = self;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil,width,height,8,0,colorSpace,(CGBitmapInfo)kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(context);
    return grayImage;
}

+ (UIImage *)imageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)drawInRect:(CGRect)rect contentFillMode:(PPYImageContentFillMode)mode clipToBounds:(BOOL)clip
{
    if (self.size.width <= 0 || self.size.height <=0 || rect.size.width <= 0 || rect.size.height <=0) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        return;
    }
    
    CGContextSaveGState(context);
    
    if (clip) {
        CGContextClipToRect(context, rect);
    }
    
    CGRect targetRect;
    switch (mode) {
        case PPYImageContentFillModeScaleToFill:{
            targetRect = rect;
        }
            break;
            
        case PPYImageContentFillModeScaleAspectFit:{
            CGSize s0 = self.size;
            CGFloat h1 = rect.size.width / s0.width * s0.height;
            if (h1 > rect.size.height) {
                targetRect.size.height = rect.size.height;
                targetRect.size.width = rect.size.height * s0.width / s0.height;
                targetRect.origin.y = rect.origin.y;
                CGRectRefSetCenterX(&targetRect, CGRectGetMidX(rect));//centerX
            }
            else{
                targetRect.size.width = rect.size.width;
                targetRect.size.height = h1;
                targetRect.origin.x = rect.origin.x;
                CGRectRefSetCenterY(&targetRect, CGRectGetMidY(rect));//centerY
            }
        }
            break;
        case PPYImageContentFillModeScaleAspectFill:{
            CGSize s0 = self.size;
            CGFloat h1 = rect.size.width / s0.width * s0.height;
            if (h1 >= rect.size.height) {
                targetRect.size.width = rect.size.width;
                targetRect.size.height = h1;
                targetRect.origin.x = rect.origin.x;
                CGRectRefSetCenterY(&targetRect, CGRectGetMidY(rect));//centerY
            }
            else{
                targetRect.size.height = rect.size.height;
                targetRect.size.width = rect.size.height * s0.width / s0.height;
                targetRect.origin.y = rect.origin.y;
                CGRectRefSetCenterX(&targetRect, CGRectGetMidX(rect));//centerX
            }
        }
            break;
        case PPYImageContentFillModeRedraw:{
            targetRect = rect;
        }
            break;
        case PPYImageContentFillModeCenter:{
            targetRect.size = self.size;
            CGRectRefSetCenter(&targetRect, CGRectGetCenter(rect));
        }
            break;
        case PPYImageContentFillModeTop:{
            targetRect.size = self.size;
            CGRectRefSetCenterX(&targetRect, CGRectGetMidX(rect));//centerX
            targetRect.origin.y = rect.origin.y;//top
        }
            break;
        case PPYImageContentFillModeBottom:{
            targetRect.size = self.size;
            CGRectRefSetCenterX(&targetRect, CGRectGetMidX(rect));//centerX
            CGRectRefSetMaxY(&targetRect, CGRectGetMaxY(rect));//bottom
        }
            break;
        case PPYImageContentFillModeLeft:{
            targetRect.size = self.size;
            targetRect.origin.x = rect.origin.x;//left
            CGRectRefSetCenterY(&targetRect, CGRectGetMidY(rect));//centerY
        }
            break;
        case PPYImageContentFillModeRight:{
            targetRect.size = self.size;
            CGRectRefSetMaxX(&targetRect, CGRectGetMaxX(rect));//right
            CGRectRefSetCenterY(&targetRect, CGRectGetMidY(rect));//centerY
        }
            break;
        case PPYImageContentFillModeTopLeft:{
            targetRect.size = self.size;
            targetRect.origin = rect.origin;
        }
            break;
        case PPYImageContentFillModeTopRight:{
            targetRect.size = self.size;
            CGRectRefSetMaxX(&targetRect, CGRectGetMaxX(rect));//right
            targetRect.origin.y = rect.origin.y;//top
        }
            break;
        case PPYImageContentFillModeBottomLeft:{
            targetRect.size = self.size;
            CGRectRefSetX(&targetRect, rect.origin.x);//left
            CGRectRefSetMaxY(&targetRect, CGRectGetMaxY(rect));//bottom
        }
            break;
        case PPYImageContentFillModeBottomRight:{
            targetRect.size = self.size;
            CGRectRefSetMaxX(&targetRect, CGRectGetMaxX(rect));//right
            CGRectRefSetMaxY(&targetRect, CGRectGetMaxY(rect));//bottom
        }
            break;
            
        default:
            break;
    }
    
    [self drawInRect:targetRect];
    
    CGContextRestoreGState(context);
}

- (UIImage *)roundImageWithRadius:(CGFloat)radius contentFillMode:(PPYImageContentFillMode)mode borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    UIImage *resultImage;
    CGRect rect = CGRectZero;
    rect.size.width = radius * 2;
    rect.size.height = radius * 2;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(radius*2, radius*2), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, YES);
    
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [self drawInRect:rect contentFillMode:mode clipToBounds:YES];
    
    if (borderWidth > 0 && borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextSetLineWidth(context, borderWidth+0.5);
        CGContextStrokeEllipseInRect(context, rect);
    }
    
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
