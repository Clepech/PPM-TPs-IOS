//
//  SelectSideView.m
//  Chatelet
//
//  Created by m2sar on 13/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "SelectSideView.h"

#define LABH 25
#define SPACE1 30
#define SPACE2 10

#define SEGH (70*1)
#define SEGW (200*1)

#define SEPARH SEGH
#define SEPARW (SEGW / 40)

@implementation SelectSideView{
    UIImageView *background;
    UIImageView *separator;

    UILabel *adminLab;
    UILabel *qLab;
}
@synthesize segment;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        double curY = 0;
        
        background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fond-2048x2048.jpg"]];
        
        curY += 20;
        adminLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curY, frame.size.width, LABH)];
        [adminLab setText:@"Administration"];
        [adminLab setTextAlignment:NSTextAlignmentCenter];
        
        curY += LABH + SPACE1;
        qLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curY, frame.size.width, LABH)];
        [qLab setText:@"De quel côté êtes vous?"];
        [qLab setTextAlignment:NSTextAlignmentCenter];
        
        curY += LABH + SPACE2;
        
        NSArray *tab = [[NSArray alloc] initWithObjects: @"Jedi", @"Obscure", nil];
        segment = [[UISegmentedControl alloc] initWithItems:tab];
        [segment setBackgroundImage:[UIImage imageNamed:@"back-segmented.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        segment.frame = CGRectMake((frame.size.width - SEGW) /2, curY, SEGW, SEGH);
        [segment setSelectedSegmentIndex:0];
        
        separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"div-segmented.png"]];
        [separator setFrame:CGRectMake((frame.size.width - SEPARW) /2, curY, SEPARW, SEPARH)];
        
        
        [self addSubview:background];
        [self addSubview:adminLab];
        [self addSubview:qLab];
        
        [self addSubview:segment];
        [self addSubview:separator];/*
        [background release];
        [adminLab release];
        [qLab release];
        [segment release];
                                     */
    }
    return self;
}


//- (void)dealloc{}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
