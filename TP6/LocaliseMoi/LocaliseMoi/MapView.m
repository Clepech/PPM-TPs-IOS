//
//  MapView.m
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "MapView.h"

#define TEXTH 70
#define EDGES 20

@implementation MapView{
    UIImageView *background;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        double curH = 0;
        
        background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fond-terre.jpg"]];
    
        curH += 20; // Decalage de la barre de notifpour iOS 7
        curH += 50; // Decalage de la barre de la navigation view
        
        curH += EDGES;
        
        _text = [[UITextView alloc] initWithFrame:CGRectMake(EDGES, curH, frame.size.width - 2* EDGES, TEXTH) textContainer:nil];
        [_text setBackgroundColor:[UIColor lightGrayColor]];
        [_text setReturnKeyType:UIReturnKeyGo];
        
        curH += TEXTH + EDGES;
        
       _map = [[MKMapView alloc] initWithFrame:CGRectMake(EDGES, curH, frame.size.width - 2* EDGES, frame.size.height - (curH + EDGES))];
        
        [self addSubview:background];
        [self addSubview:_text];
        [self addSubview:_map];
        
    }
    return self;
}

- (void)setOrientation{
    CGRect frame = [self frame];
    double curH = 0;
    
    curH += 20; // Decalage de la barre de notifpour iOS 7
    curH += 48; // Decalage de la barre de la navigation view
    
    curH += EDGES;
    [_text setFrame:CGRectMake(EDGES, curH, frame.size.width - 2* EDGES, TEXTH)];
    
    curH += TEXTH + EDGES;
    
    [_map setFrame:CGRectMake(EDGES, curH, frame.size.width - 2* EDGES, frame.size.height - (curH + EDGES))];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [_text release];
    [background release];
    [_map release];
    [super dealloc];
}


@end
