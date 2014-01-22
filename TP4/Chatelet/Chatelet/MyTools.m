//
//  MyTools.m
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "MyTools.h"

@implementation MyTools



+ (UIImage *)resizeToSquare:(UIImage *)image ofSize:(int)dim{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize taille = {dim, dim};
    UIGraphicsBeginImageContextWithOptions(taille, NO, scale);
    [image drawInRect:CGRectMake(0, 0, dim, dim)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
