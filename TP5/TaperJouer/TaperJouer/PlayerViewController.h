//
//  PlayerViewController.h
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
//#import "HistoricTableVC.h"


@interface PlayerViewController : UIViewController <MPMediaPickerControllerDelegate>

@property (nonatomic, readonly, retain)  MPMusicPlayerController *myMediaPlayer;


- (void) showNavigationButton:(UIBarButtonItem*)b;
- (void) hideNavigationButton;
@end
