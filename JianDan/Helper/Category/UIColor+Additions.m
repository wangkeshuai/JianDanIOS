//
//  UIColor+Additions.m
//  JianDan
//
//  Created by 刘献亭 on 15/10/20.
//  Copyright © 2015年 刘献亭. All rights reserved.
//

#import "UIColor+Additions.h"
#import "NSString+Additions.h"

@implementation UIColor (Additions)

- (UIImage*) createImage
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage*) createImageWithText:(NSString *)text size:(CGSize)size textColor:(UIColor*)textColor
{
    CGRect rect=(CGRect){CGPointZero,size};
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIFont *textFont=[UIFont fontWithName:@"zikutanghzkt" size:50];
    CGSize textSize=[text sizeOfSimpleTextWithContrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) fromFont:textFont];
    [text drawAtPoint:CGPointMake((size.width-textSize.width)/2,(size.height-textSize.height)/2) fromFont:textFont color:textColor];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
