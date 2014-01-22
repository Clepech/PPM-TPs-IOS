//
//  ViewController.h
//  Dizainizer
//
//  Created by m2sar on 18/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *geekOut;
- (IBAction)geekAct:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *plusMoinsOut;
- (IBAction)plusMoinsAct:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *dizOut;
- (IBAction)dizAct:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitOut;
- (IBAction)unitAct:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *slideOut;
- (IBAction)slideAct:(id)sender;
- (IBAction)resetAct:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resOut;
- (void) MajAll;

@end
