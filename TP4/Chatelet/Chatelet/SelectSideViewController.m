//
//  SelectSideViewController.m
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "SelectSideViewController.h"
#import "MyTools.h"
#import "SelectSideView.h"

@interface SelectSideViewController ()

@end

@implementation SelectSideViewController{
    SelectSideView *view;
}

@synthesize segment;
- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        view = [[SelectSideView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [self setView:view];
        UIImage *img = [MyTools resizeToSquare:[UIImage imageNamed:@"gear.png"] ofSize:30];
        UITabBarItem *tabBar = [[UITabBarItem alloc] initWithTitle:@"Admin" image:img tag:1];
        [self setTabBarItem:tabBar];
        segment = [view segment];

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

- (void)dealloc{
    [view release];
    view = nil;
    [super dealloc];
}


@end
