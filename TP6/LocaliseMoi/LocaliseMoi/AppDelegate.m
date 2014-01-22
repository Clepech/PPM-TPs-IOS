//
//  AppDelegate.m
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "HistoryTableVC.h"

@implementation AppDelegate{
    MapViewController *mapVC;
    HistoryTableVC *historyTVC;
    UITabBarController *tabBarVC;
    UINavigationController *navRoot;
    UINavigationController *navDetail;
    UISplitViewController *splitVC;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        _isIPad = YES;
    }else{
        _isIPad = NO;
    }
    
    mapVC = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    historyTVC = [[HistoryTableVC alloc] initWithStyle:UITableViewStylePlain];
    [historyTVC setMapVC:mapVC];
    
    navRoot = [[UINavigationController alloc] initWithRootViewController:historyTVC];
    navDetail =[[UINavigationController alloc] initWithRootViewController:mapVC];
    NSArray *tab = [[NSArray alloc] initWithObjects:navRoot, navDetail, nil];
    
    
    if ([self isIPad]) {
        splitVC = [[UISplitViewController alloc] init];
        [splitVC setViewControllers:tab];
        [splitVC setDelegate:historyTVC];
        [_window setRootViewController:splitVC];
        [splitVC release];
    }else{
        tabBarVC = [[UITabBarController alloc] init];
        [tabBarVC setViewControllers:tab animated:YES];
        [_window addSubview:[tabBarVC view]];
        [_window setRootViewController:tabBarVC];
        [tabBarVC setSelectedIndex:1];
        [tabBarVC release];

    }
    
    [tab release];
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

- (void) dealloc{
    [mapVC release];
    [historyTVC release];
    [navDetail release];
    [navRoot release];
    [super dealloc];
}
@end
