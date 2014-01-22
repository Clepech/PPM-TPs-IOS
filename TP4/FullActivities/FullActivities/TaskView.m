//
//  TaskView.m
//  FullActivities
//
//  Created by m2sar on 15/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "TaskView.h"

#define TITLEH 30
#define TITLEW 0.20

@implementation TaskView{
    UILabel *titleLab;
    UILabel *prioLab;
    UITextField *tf;
    UISegmentedControl *seg;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        double curH = 0;
        
        curH += 20; //décallage iOS 7
        
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width *TITLEW, TITLEH)];
        tf = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width *TITLEW, curH, (1 -frame.size.width) *TITLEW, TITLEH)];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
