//
//  View.m
//  Bille
//
//  Created by m2sar on 24/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "View.h"
#define LABELH 50
#define SPACEH 5

@implementation View{
    NSArray *backgroundViews;
    int currentBackgroud;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        // fonds
        currentBackgroud = 0;
        
        UIImageView *greenBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vert.jpg"]];
        UIImageView *redBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rouge.jpg"]];
        UIImageView *yellowBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jaune.jpg"]];
        UIImageView *blueBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bleu.jpg"]];
        backgroundViews = [[NSArray alloc] initWithObjects:greenBack, blueBack, yellowBack, redBack, nil];
        
        for (UIImageView *imgv in backgroundViews) {
            [self addSubview:imgv];
            [imgv setHidden:YES];
        }
        [[backgroundViews objectAtIndex:currentBackgroud] setHidden:NO];
        
        //Bille
        _bille = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bille.png"]];
        [_bille setCenter:CGPointMake(frame.size.width / 2, frame.size.height / 2)];
        [self addSubview:_bille];
        
        // Labels
        float curH = 80;
        _posLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABELH)];
        [_posLab setText:@"pos"];
        [_posLab setTextAlignment:NSTextAlignmentCenter];
        
        curH += SPACEH + LABELH;
        _deltaLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABELH)];
        [_deltaLab setText:@"delta"];
        [_deltaLab setTextAlignment:NSTextAlignmentCenter];
        
        curH += SPACEH + LABELH;
        _accLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABELH)];
        [_accLab setText:@"acc"];
        [_accLab setTextAlignment:NSTextAlignmentCenter];
        
        curH += SPACEH + LABELH;
        _boolLab =  [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABELH)];
        [_boolLab setText:@"bool"];
        [_boolLab setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:_posLab];
        [self addSubview:_deltaLab];
        [self addSubview:_accLab];
        [self addSubview:_boolLab];
        
    }
    return self;
}

- (void) nextBackground{
    [[backgroundViews objectAtIndex:currentBackgroud] setHidden:YES];
    currentBackgroud = (currentBackgroud + 1) % [backgroundViews count];
    [[backgroundViews objectAtIndex:currentBackgroud] setHidden:NO];
    
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
