//
//  MoodSelectionView.h
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoodSelectionView : UIView <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, readonly, retain) UIPickerView *picker;

+(NSArray*)moods;
@end
