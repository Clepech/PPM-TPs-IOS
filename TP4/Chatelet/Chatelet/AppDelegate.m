//
//  AppDelegate.m
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "AppDelegate.h"
#import "SelectSideViewController.h"
#import "StationTableViewController.h"

@implementation AppDelegate{
    UITabBarController *tbc;
    UINavigationController *nc;
    StationTableViewController *stationVC;
    SelectSideViewController *sideVC;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    sideVC = [[SelectSideViewController alloc] init];
    stationVC = [[StationTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tbc = [[UITabBarController alloc] init];
    
    nc = [[UINavigationController alloc] initWithRootViewController:stationVC];
    
    [[sideVC  segment] addTarget:self action:@selector(changeSide:) forControlEvents:UIControlEventValueChanged];
    
    NSArray *tab = [NSArray arrayWithObjects:sideVC, nc, nil];
    
    [tbc setViewControllers:tab animated:YES];
    
    [_window addSubview:[tbc view]];
    [_window setRootViewController:tbc];
    
    [_window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (IBAction)changeSide:(id)sender{
    // Mode feignant, on devrait verifier l'index du segment selectionné pour bien faire
    if([sender class] == [UISegmentedControl class]){
        if ([sender selectedSegmentIndex] == 0) {
            [stationVC setSide:YES];
        } else if([sender selectedSegmentIndex] == 1){
            [stationVC setSide:NO];
        }else{
            NSLog(@"On ne doit pas arriver là");
        }
    }
 
}

//- (void) dealloc{}

@end
