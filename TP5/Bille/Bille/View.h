//
//  View.h
//  Bille
//
//  Created by m2sar on 24/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView

@property (nonatomic, readonly, retain) UIImageView *bille;
@property (nonatomic, readonly, retain) UILabel *posLab;
@property (nonatomic, readonly, retain) UILabel *deltaLab;
@property (nonatomic, readonly, retain) UILabel *accLab;
@property (nonatomic, readonly, retain) UILabel *boolLab;

- (void) nextBackground;
@end
