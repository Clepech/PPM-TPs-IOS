//
//  StationCell.h
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationCell : NSObject/*{
    UIImage *image;
    NSString *name;
    BOOL isJedi;
}*/

@property (nonatomic, readonly, copy) NSString * name;
@property (nonatomic, readonly, retain) NSString * imageName;
@property (nonatomic, readonly) BOOL isJedi;
@property (nonatomic, readonly) int index;
+ (NSArray *) getSides;
+ (NSArray *) getNamesList;

- (id)initWithIndex:(int)index;
@end
