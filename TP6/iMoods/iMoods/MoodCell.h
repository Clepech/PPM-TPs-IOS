//
//  Cell.h
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoodCell : NSObject

@property (nonatomic, readwrite, retain) NSString *name;
@property (nonatomic, readwrite, retain) NSString *mood;

- (id)initWithName:(NSString*)name andMood:(NSString*)mood;
@end
