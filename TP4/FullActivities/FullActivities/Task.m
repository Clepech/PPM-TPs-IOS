//
//  Task.m
//  FullActivities
//
//  Created by m2sar on 15/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "Task.h"

@implementation Task
@synthesize priority;
@synthesize name;

- (id)initWithPriority:(NSInteger)prio andName:(NSString *)str{
    self = [super init];
    
    if (self) {
        priority = prio;
        name = str;
    }
    return self;
}

- (void) dealloc{
    [name release];
    [super dealloc];
}

@end
