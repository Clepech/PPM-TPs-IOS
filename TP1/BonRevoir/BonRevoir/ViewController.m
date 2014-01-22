//
//  ViewController.m
//  BonRevoir
//
//  Created by m2sar on 18/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
bool flag;

- (void)viewDidLoad
{
    [super viewDidLoad];
    flag = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButAction:(id)sender {
    if(flag){
        [_LabOutlet setText:@"Bonjour"];
        [_ButOutlet setTitle:@"DisAuRevoir" forState:UIControlStateNormal];
    }else{
        [_LabOutlet setText:@"Au revoir"];
        [_ButOutlet setTitle:@"DisBonjour" forState:UIControlStateNormal];
    }
    flag = ! flag;
}
@end
