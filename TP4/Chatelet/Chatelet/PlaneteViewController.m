//
//  PlaneteViewController.m
//  Chatelet
//
//  Created by m2sar on 13/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "PlaneteViewController.h"
#import "PlaneteView.h"

@interface PlaneteViewController ()

@end

@implementation PlaneteViewController{
    PlaneteView *view;
}

- (id)initWithindex:(int)index
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        view = [[PlaneteView alloc] initWithFrame:[[UIScreen mainScreen] bounds] andindex:index];
        [self setView:view];
        //[view release];
        [[self navigationItem] setTitle:@"Vue planète"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
