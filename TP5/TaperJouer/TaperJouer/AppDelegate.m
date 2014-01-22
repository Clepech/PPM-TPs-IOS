//
//  AppDelegate.m
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "AppDelegate.h"
#import "PlayerViewController.h"
#import "HistoricTableVC.h"

@implementation AppDelegate{
    BOOL isIPad;
    UITabBarController *tabBarVC;
    UINavigationController *navRoot;
    UINavigationController *navDetail;
    UISplitViewController *splitVC;
    HistoricTableVC *historic;
    PlayerViewController *player;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
  
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        isIPad = YES;
    }else{
        isIPad = NO;
    }
    
    player = [[PlayerViewController alloc] initWithNibName:nil bundle:nil];
    
    historic = [[HistoricTableVC alloc] initWithStyle:UITableViewStyleGrouped];
    [historic setPlayerVC:player];
    
    
    NSArray *tab = [NSArray arrayWithObjects: player, historic, nil]; //retain?
  
    
    if (isIPad) {
        splitVC = [[UISplitViewController alloc] init];
        navRoot = [[UINavigationController alloc] initWithRootViewController:historic];
        navDetail =[[UINavigationController alloc] initWithRootViewController:player];
        tab = [NSArray arrayWithObjects: navRoot, navDetail, nil];
        [splitVC setViewControllers:tab];
        [splitVC setDelegate:historic];
        
        
        [_window setRootViewController:splitVC];
        
    }else{
        
        tabBarVC = [[UITabBarController alloc] init];
        tab = [NSArray arrayWithObjects: player, historic, nil];
        [tabBarVC setViewControllers:tab animated:YES];
        [_window addSubview:[tabBarVC view]];
        [_window setRootViewController:tabBarVC];
        
    }
    
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

@end
