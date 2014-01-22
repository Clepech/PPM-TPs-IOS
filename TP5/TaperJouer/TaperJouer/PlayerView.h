//
//  PlayerView.h
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerView : UIView

@property (nonatomic, readonly, retain) UILabel *statusLab;
@property (nonatomic, readonly, retain) UILabel *titleNameLab;
@property (nonatomic, readonly, retain) UILabel *counterLab;
@property (nonatomic, readonly, retain) UIImageView *background;
@property (nonatomic, readonly, retain) UIProgressView *progressBar;

@end
