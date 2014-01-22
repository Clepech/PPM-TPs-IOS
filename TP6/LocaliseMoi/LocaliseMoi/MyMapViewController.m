//
//  MapViewController.m
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "MyMapViewController.h"
#import "MyMapView.h"

@interface MyMapViewController ()

@end

@implementation MyMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {/*
        UIImage *img =[UIImage imageNamed:@"icone-terre.png"];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Localisation" image:img tag:1];
        [self setTabBarItem:tbi];

        
        //MyMapView *view = [[MyMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //[self setView:view];
        
        [img release];
        [tbi release];
        [view release];*/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
