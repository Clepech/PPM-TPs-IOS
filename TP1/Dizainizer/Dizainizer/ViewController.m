//
//  ViewController.m
//  Dizainizer
//
//  Created by m2sar on 18/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

const int MAX = 99;
int cur;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    cur = 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)geekAct:(id)sender {
    [self MajAll];

}


- (IBAction)plusMoinsAct:(id)sender {
    cur = _plusMoinsOut.value;
    [self MajAll];
}


- (IBAction)dizAct:(id)sender {
    cur = (cur %10) + 10 * [_dizOut selectedSegmentIndex];
    
    [self MajAll];
}

- (IBAction)unitAct:(id)sender {
    cur = (cur - (cur % 10)) + [_unitOut selectedSegmentIndex];
    
    [self MajAll];}

- (IBAction)slideAct:(id)sender {
    cur = (int) ([_slideOut value] * 100);
    if(cur == 100) cur = 99;
    
    [self MajAll];
}


- (IBAction)resetAct:(id)sender {
    cur = 0;
    [self MajAll];
}


//
- (void) MajAll{
    
    NSString* res;
    if (! _geekOut.on){
        res = [NSString stringWithFormat:@"%d", cur];
    }else{
        res = [NSString stringWithFormat:@"0x%x", cur];
    }
    if (cur == 42) {
        [_resOut setTextColor:[UIColor redColor]];
    }else{
        [_resOut setTextColor:[UIColor blackColor]];
    }
    
    
    [_resOut setText:res];
    _dizOut.selectedSegmentIndex = cur / 10;
    _unitOut.selectedSegmentIndex = cur % 10;
    [_slideOut setValue:(((float) cur)/99) animated:YES];
    _plusMoinsOut.value = cur;
}
@end
