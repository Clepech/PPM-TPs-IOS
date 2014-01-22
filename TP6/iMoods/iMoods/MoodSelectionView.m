//
//  MoodSelectionView.m
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "MoodSelectionView.h"
#define PICKW 160
#define PICKH 400


static NSArray *moods = nil;
@implementation MoodSelectionView{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor cyanColor]];
        [MoodSelectionView moods];
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(frame.size.width/2 -PICKW /2, frame.size.height/2 - PICKH /2, PICKW, PICKH)];
        [_picker setDataSource:self];
        [_picker setDelegate:self];
        [self addSubview:_picker];
        [_picker release];
        
        
    }
    return self;
}

#pragma mark - PickerView DataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [moods count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [moods objectAtIndex:row];
}


#pragma mark - PickerView Delegate

//-
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) dealloc{
    [super dealloc];
}

+(NSArray*)moods{
    
    if (! moods) {
        moods = [[NSArray alloc] initWithObjects:@"Happy", @"Sad", @"Blues", @"Angry", @"Envie de KFC", nil];
    }
    return moods;
}

@end
