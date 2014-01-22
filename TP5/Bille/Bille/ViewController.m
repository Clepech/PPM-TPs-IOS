//
//  ViewController.m
//  Bille
//
//  Created by m2sar on 24/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>{
}

@end

@implementation ViewController{
    float accX, accY;
    float posX, posY;
    float deltaX, deltaY;
    BOOL hasPlayX, hasPlayY;
    AVAudioPlayer *player;
    View *view;
    CMMotionManager *motionMnger;
    NSTimer *timer;
    NSError *err;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    motionMnger =[[CMMotionManager alloc] init];
    [motionMnger setDeviceMotionUpdateInterval:0.01];
    
    
    view = [[View alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setView:view];
    [self becomeFirstResponder];
    
    accX = 0;
    accY = 0;
    deltaX = 0;
    deltaY = 0;
    posX = [[view bille] frame].origin.x;
    posY = [[view bille] frame].origin.y;
    hasPlayX = NO;
    hasPlayY = NO;
    
    [motionMnger startAccelerometerUpdates];
    timer = [[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updatePos:) userInfo:nil repeats:YES] retain];
    
    //Player
    NSURL *url = [[NSURL alloc] initWithString:[[NSBundle mainBundle] pathForResource:@"son" ofType:@".mp3"]];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    [player setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) canBecomeFirstResponder{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        [view nextBackground];
    }
}

- (void)updatePos:(NSTimer *) timer{
    // récuperation des positions courantes
    posX = [[view bille] frame].origin.x;
    posY = [[view bille] frame].origin.y;
    float billeH = [[view bille] frame].size.height;
    float billeW = [[view bille] frame].size.width;
    deltaX = [motionMnger accelerometerData].acceleration.x;
    deltaY = [motionMnger accelerometerData].acceleration.x;
    
    
    accX = [motionMnger accelerometerData].acceleration.x + accX;
    accY = [motionMnger accelerometerData].acceleration.y + accY;
    
    accX = MIN(accX, 10.0);
    accY = MIN(accY, 10.0);
    
    posX = posX + [motionMnger accelerometerData].acceleration.x * accX;
    posY = posY + accY * [motionMnger accelerometerData].acceleration.y;
    
    // Pour ne pas sortir des bords
    posX = MIN(posX , [view bounds].size.width - billeW);
    posX = MAX(posX, 0.0);
    posY = MIN(posY, [view bounds].size.height - billeH);
    posY = MAX(posY, 0.0);
    
    // Gestion du son
    if ((posX == 0.0 || posX == ([view bounds].size.width - billeW)) && !hasPlayX ) {
        hasPlayX = YES;
        [player play];
        
    }
    if ((posY == 0.0 || posY == ([view bounds].size.height - billeH)) && !hasPlayY ) {
        hasPlayY = YES;
        [player play];
    }
    //réinitialisation des son TODO à verif
    if ((posX != 0.0 && posX != ([view bounds].size.width - billeW)) && hasPlayX ) {
        hasPlayX = NO;
    }
    if ((posY != 0.0 && posY != ([view bounds].size.height - billeH)) && hasPlayY ) {
        hasPlayY = NO;
    }
    
    //MaJ des sous vues
    [[view accLab] setText:[NSString stringWithFormat:@"x=%f    acc    y=%f", accX, accY]];
    [[view posLab] setText:[NSString stringWithFormat:@"x=%f    pos    y=%f", posX, posY]];
    [[view deltaLab] setText:[NSString stringWithFormat:@"x=%f    delta    y=%f", deltaX, deltaY]];
    [[view boolLab] setText:[NSString stringWithFormat:@"x=%d    bool    y=%d", hasPlayX, hasPlayY]];
    [[view bille] setFrame:CGRectMake(posX, posY, billeW, billeH)];
}


@end
