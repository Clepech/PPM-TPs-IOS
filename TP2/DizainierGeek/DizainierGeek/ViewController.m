//
//  ViewController.m
//  DizainierGeek
//
//  Created by m2sar on 25/11/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MainView * mainView = [[MainView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setView:mainView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
