//
//  PlaneteView.m
//  Chatelet
//
//  Created by m2sar on 13/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "PlaneteView.h"
#import "StationCell.h"


#define SPACE0 80
#define IMGW 200
#define IMGH IMGW

#define SPACE1 20

#define LABH 35

@implementation PlaneteView{
    UIImageView *img;
    UILabel *lab;
}


- (id)initWithFrame:(CGRect)frame andindex:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        double curY = 0;
        curY += 20;
        
        curY += SPACE0;
        [self setBackgroundColor:[UIColor blackColor]];
        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"planete-%d.png", index]]];
        [img setFrame:CGRectMake((frame.size.width-IMGW) /2, curY, IMGW, IMGH)];
        
        curY += IMGH + SPACE1;
        lab =[[UILabel alloc] initWithFrame:CGRectMake(0, curY, frame.size.width, LABH)];
        [lab setText:[NSString stringWithFormat:@"Vu de la planète %@", [[StationCell getNamesList] objectAtIndex:index]]];
        [lab setTextColor:[UIColor whiteColor]];
        [lab setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:img];
        [self addSubview:lab];
        [img release];
        [lab release];
        
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
