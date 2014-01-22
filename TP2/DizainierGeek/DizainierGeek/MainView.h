//
//  View.h
//  DizainierGeek
//
//  Created by m2sar on 25/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView{
    UILabel *resultLabel;
    UILabel *geekLabel;
    UILabel *tensLabel;
    UILabel *unitsLabel;
    UIButton *resetButton;
    UIStepper *stepper;
    UISegmentedControl *tensSC;
    UISegmentedControl *unitsSC;
    UISwitch *geekSwitch;
    UISlider *slider;

}
@end
