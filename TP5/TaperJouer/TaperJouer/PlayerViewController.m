//
//  PlayerViewController.m
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerView.h"
#import "MyTools.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PlayerViewController ()

@end

@implementation PlayerViewController{
    PlayerView *view;
    UISwipeGestureRecognizer *swipeRec;
    UITapGestureRecognizer *tapRec;
    NSInteger nbTrack;
    BOOL isPlaying;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    nbTrack = 0;
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        MPMediaQuery *everything = [MPMediaQuery songsQuery];
        nbTrack = [[everything collections] count];
        _myMediaPlayer = [MPMusicPlayerController applicationMusicPlayer];
        [_myMediaPlayer setQueueWithQuery:everything];
        
        UIImage *img = [MyTools resizeToSquare:[UIImage imageNamed:@"images/tete-a-toto.png"] ofSize:30];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Musique" image:img tag:1];
        [self setTabBarItem:tbi];
        [img release];
        [tbi release];
        view = [[PlayerView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        swipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goNext:)];
        [swipeRec setDirection:UISwipeGestureRecognizerDirectionLeft];
        
        tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playPause:)];
        [tapRec setNumberOfTapsRequired:2];
        
        [self setView:view];
        
        [[self view] addGestureRecognizer:swipeRec];
        [[self view] addGestureRecognizer:tapRec];
        
        [[self navigationItem] setTitle:@"Musique"];
        
        [_myMediaPlayer beginGeneratingPlaybackNotifications];
        [_myMediaPlayer skipToBeginning];
        [[view counterLab] setText:[NSString stringWithFormat:@"0 /%d", nbTrack]];
        isPlaying = false;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uptadeTrackInfo{
    
    if (nbTrack > 0 && [_myMediaPlayer indexOfNowPlayingItem] < nbTrack){
        [[view titleNameLab] setText:[[_myMediaPlayer nowPlayingItem] valueForProperty:MPMediaItemPropertyTitle]];
        [[view counterLab] setText:[NSString stringWithFormat:@"%ld /%ld", (long) [_myMediaPlayer indexOfNowPlayingItem] +1, (long)nbTrack]];
        [[view progressBar] setProgress:( ((float) ([_myMediaPlayer indexOfNowPlayingItem] + 1)) / ((float) nbTrack))];
    }

}

- (IBAction)goNext:(id)sender{
    // Ajout dans l'historique
    [_myMediaPlayer skipToNextItem];
    [self uptadeTrackInfo];

}

- (IBAction)playPause:(id)sender{
    if (isPlaying) {
        [_myMediaPlayer pause];
        [[view statusLab] setText:@"Arrêt"];
        [view setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0]];
    }else{
        [_myMediaPlayer play];
        [[view statusLab] setText:@"Ecoute"];
        [view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
        [self uptadeTrackInfo];
    }
    isPlaying = ! isPlaying;
}

- (void) showNavigationButton:(UIBarButtonItem*)b{
    [[self navigationItem] setLeftBarButtonItem:b];
}
- (void) hideNavigationButton{
    [[self navigationItem] setLeftBarButtonItem:nil];
}

@end
