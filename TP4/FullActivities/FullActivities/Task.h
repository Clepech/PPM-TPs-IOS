//
//  Task.h
//  FullActivities
//
//  Created by m2sar on 15/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, readwrite) NSInteger priority;
@property (nonatomic, readwrite, copy) NSString *name;

@end
