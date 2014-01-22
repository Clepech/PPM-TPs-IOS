//
//  View.m
//  DizainierGeek
//
//  Created by m2sar on 25/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "MainView.h"

#define TOPBORDER 20
#define LEFTBORDER 20
#define RIGHTBORDER 20
#define BOTBORDER 20

#define GEEKLABW 90

#define TENSLABW 100
#define TENSLABH 30

#define UNITLABW TENSLABW
#define UNITLABH TENSLABH

#define TENSSCH 25
#define UNITSCH TENSSCH

#define RESLABW TENSLABW
#define RESLABH TENSLABH

#define RESETW 150
#define RESETH 40

#define SLIDH 25

@implementation MainView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialisations
        // Comme on place les composants de hauts en bas Y donne le y courant pour le composant à placer
        double curY = TOPBORDER;
        //double screenH = frame.size.height; //type CGFloat : double en 64bits, float en 32
        double screenW = frame.size.width;
        
        //Pour connaitre la largeur d'un switch
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        double switchW = mySwitch.frame.size.width;
        double switchH = mySwitch.frame.size.height;
        [mySwitch release];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        
        // Stepper (plus/moins)
        stepper = [[UIStepper alloc] initWithFrame:CGRectMake(LEFTBORDER, curY, 0, 0)];
        [stepper setMinimumValue:99];
        [stepper setMinimumValue:0];
        [stepper setValue:0];
        
        
        // Label "Mode geek"
        geekLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenW - LEFTBORDER - switchW - GEEKLABW - 2, TOPBORDER, GEEKLABW, switchH)];
        [geekLabel setText:@"Mode geek"];
        [geekLabel setTextAlignment:NSTextAlignmentRight];
        
        geekSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(screenW - LEFTBORDER - switchW , curY, 0, 0)];
        [geekSwitch setOn:NO animated:YES];
        
        
        // Label "Dizaines"
        curY += switchH ;
        tensLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenW/2)-(TENSLABW/2), curY, TENSLABW, TENSLABH)];
        [tensLabel setText:@"Dizaines"];
        [tensLabel setTextAlignment:NSTextAlignmentCenter];
        
        // Segment pour les dizaines
        curY += TENSLABH;
        NSArray *items = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        
        tensSC = [[UISegmentedControl alloc] initWithItems:items];
        tensSC.frame = CGRectMake(LEFTBORDER, curY, screenW - LEFTBORDER - RIGHTBORDER, TENSSCH);
        
        
        // Label "Unités"
        curY += TENSSCH ;
        unitsLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenW/2)-(UNITLABW/2), curY, UNITLABW, UNITLABH)];
        [unitsLabel setText:@"Unités"];
        [unitsLabel setTextAlignment:NSTextAlignmentCenter];
        
        // segment pour les unités
        curY += UNITLABH;
        unitsSC = [[UISegmentedControl alloc] initWithItems:items];
        unitsSC.frame = CGRectMake(LEFTBORDER, curY, screenW - LEFTBORDER - RIGHTBORDER, UNITSCH);
        [items release]; //TODO Verifier qu'on fait bien un copy de l'array
        
        
        // Label de résultat
        curY += UNITSCH;
        resultLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenW/2)-(RESLABW/2), curY, RESLABW, RESLABH)];
        [resultLabel setText:@"0"];
        [resultLabel setTextAlignment:NSTextAlignmentCenter];
        
        
        // Slider
        curY += RESLABH;
        slider = [[UISlider alloc] initWithFrame:CGRectMake(LEFTBORDER, curY, screenW - LEFTBORDER - RIGHTBORDER, SLIDH)];
        [slider setValue:0 animated:YES];
        
        
        // Bouton reset
        curY += SLIDH;
        resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
        resetButton.frame = CGRectMake((screenW/2)-(RESETW/2), curY, RESETW, RESETH);
       
        
        
        // Ajout des objets créés
        [self addSubview:stepper];
        [self addSubview:geekLabel];
        [self addSubview:geekSwitch];
        [self addSubview:tensLabel];
        [self addSubview:tensSC];
        [self addSubview:unitsLabel];
        [self addSubview:unitsSC];
        [self addSubview:slider];
        [self addSubview:resultLabel];
        [self addSubview:resetButton];
    }
    return self;
}

-(void) update{
    
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
