//
//  UIImage+PPYToolkit.h
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The content fill mode for drawing a image
 */
typedef NS_ENUM(NSInteger, PPYImageContentFillMode){
    PPYImageContentFillModeScaleToFill = UIViewContentModeScaleToFill,  // scale the content to fit the size by changing the aspect ratio of the content if necessary
    PPYImageContentFillModeScaleAspectFit = UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    PPYImageContentFillModeScaleAspectFill = UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    PPYImageContentFillModeRedraw = UIViewContentModeRedraw,    //same as PPYImageContentFillModeScaleToFill
    PPYImageContentFillModeCenter = UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
    PPYImageContentFillModeTop = UIViewContentModeTop,
    PPYImageContentFillModeBottom = UIViewContentModeBottom,
    PPYImageContentFillModeLeft = UIViewContentModeLeft,
    PPYImageContentFillModeRight = UIViewContentModeRight,
    PPYImageContentFillModeTopLeft = UIViewContentModeTopLeft,
    PPYImageContentFillModeTopRight = UIViewContentModeTopRight,
    PPYImageContentFillModeBottomLeft = UIViewContentModeBottomLeft,
    PPYImageContentFillModeBottomRight = UIViewContentModeBottomRight,
};

@interface UIImage (PPYToolkit)
+ (UIImage *)imageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius color:(UIColor *)color;

+ (UIImage *)gradientImageWithColors:(NSArray *)colors locations:(NSArray *)locations size:(CGSize)size startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

+ (UIImage *)imagewithLayeredImages:(NSArray *)imageArrays size:(CGSize)size;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

/**
 *  缩放图片
 *
 *  相当于调用:
 *
 *  @code
 *      [self resizeToSize:size contentFillMode:PPYImageContentFillModeScaleToFill scale:self.scale];
 *  @endcode
 *
 *  @param size 新尺寸，单位为point而非像素
 *
 *  @return 缩放后的图片
 */
- (UIImage *)resizeToSize:(CGSize)size;

/**
 *  缩放图片
 *
 *  相当于:
 *
 *  @code
 *      [self resizeToSize:size contentFillMode:fillMode scale:self.scale];
 *  @endcode
 *
 *  @param size     新尺寸,单位为point而非像素
 *  @param fillMode 填充模式
 *
 *  @return 缩放后的图片
 */
- (UIImage *)resizeToSize:(CGSize)size contentFillMode:(PPYImageContentFillMode)fillMode;

/**
 *  缩放图片
 *
 *  @param size     新尺寸，单位为point而非像素
 *  @param fillMode 填充模式
 *  @param scale    缩放比例，如果是0.0，则与设备主屏幕的scale一样
 *
 *  @return 缩放后的图片
 */
- (UIImage *)resizeToSize:(CGSize)size contentFillMode:(PPYImageContentFillMode)fillMode scale:(CGFloat)scale;

/**
 *  绘制图片
 *
 *  @param rect 图片绘制区域
 *  @param mode 填充模式
 *  @param clip 超出绘制区域的部分是否被裁剪掉
 */
- (void)drawInRect:(CGRect)rect contentFillMode:(PPYImageContentFillMode)mode clipToBounds:(BOOL)clip;

/**
 *  生成一个圆角图片
 *
 *  @param radius      圆角半径
 *  @param mode        填充模式
 *  @param borderWidth 边界线宽度
 *  @param borderColor 边界线颜色
 *
 *  @return 新的圆角图片
 */
- (UIImage *)roundImageWithRadius:(CGFloat)radius contentFillMode:(PPYImageContentFillMode)mode borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
