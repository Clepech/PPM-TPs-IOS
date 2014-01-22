//
//  Cell.m
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "MoodCell.h"

@implementation MoodCell

- (id)initWithName:(NSString*)name andMood:(NSString*)mood{
    self = [super init];
    if (self) {
        _mood = mood;
        [_mood retain];
        _name = name;
        [_name retain];
    }
    return self;
}

- (void) dealloc{
    [_name release];
    [_mood release];
    [super dealloc];
}
@end
