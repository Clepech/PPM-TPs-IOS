//
//  PlayerView.m
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "PlayerView.h"
#define SPACE0 50
#define LABH 30
#define SPACES 15
#define BAREDGE 20

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        double curH = 0;
        
        NSLog(@"bounds W:%f H:%f", frame.size.width, frame.size.height);
        
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images/fond-2048x2048.jpg"]];
        
        curH += 20;
        
        curH += SPACE0;
        _statusLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABH)];
        [_statusLab setText:@"Arrêt"];
        [_statusLab setTextAlignment:NSTextAlignmentCenter];
        
        curH += LABH + SPACES;
        _titleNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABH)];
        [_titleNameLab setText:@""];
        [_titleNameLab setTextAlignment:NSTextAlignmentCenter];
        
        curH += LABH + SPACES;
        _progressBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        [_progressBar setFrame:CGRectMake(BAREDGE, curH, frame.size.width - 2 * BAREDGE, LABH)];
        [_progressBar setProgress:0];
        
        curH += LABH + SPACES;
        _counterLab = [[UILabel alloc] initWithFrame:CGRectMake(0, curH, frame.size.width, LABH)];
        [_counterLab setText:@"0 / 0"];
        [_counterLab setTextAlignment:NSTextAlignmentCenter];

        [self addSubview:_background];
        [_background release];
        [self addSubview:_statusLab];
        [_statusLab release];
        [self addSubview:_titleNameLab];
        [_titleNameLab release];
        [self addSubview:_progressBar];
        [_progressBar release];
        [self addSubview:_counterLab];
        [_counterLab release];
        
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
