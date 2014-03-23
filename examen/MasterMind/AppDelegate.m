//
//  AppDelegate.m
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import "AppDelegate.h"
#import "aGame.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BOOL isIpad;
    aGame *g;
    
    // ==============================================================
    // ==============================================================
    // Question I.1
    // ==============================================================
    // ==============================================================
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
         isIpad = YES;
    }else{
        isIpad = NO;
    }
   
    // ==============================================================
    // fin question
    // ==============================================================
    
    // ==============================================================
    // ==============================================================
    // Question I.1
    // ==============================================================
    // ==============================================================
    // en attendant pour que cela fonctionne
    g = [[aGame alloc] init];
    [g initializeGameWithSize:4];
    
    // ==============================================================
    // fin question
    // ==============================================================
    //[g setDebugMode:YES]; // activer le debug

    RootViewController *rvc = [[RootViewController alloc] initWithIsIpad:isIpad andGame:g];
    MindViewController *dvc = [[MindViewController alloc] initWithIsIpad:isIpad andGame:g];
    [dvc setRvc:rvc];
    // ==============================================================
    // ==============================================================
    // Question I.2
    // ==============================================================
    // ==============================================================
    // En attendant pour que ca marche (activer l'une ou l'autre des vues
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:rvc];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:dvc];
    NSArray *tab = [[NSArray alloc] initWithObjects:nav1, nav2, nil];
    if (isIpad) {
        UISplitViewController *split = [[UISplitViewController alloc] init];
        [split setViewControllers:tab];
        [_window setRootViewController:split];
        [split release];
    }else{
        UITabBarController *tb = [[UITabBarController alloc] init];
        [tb setViewControllers:tab];
        [_window setRootViewController:tb];
        [tb release];
    }
    //[_window setRootViewController:nav2];
    // ==============================================================
    // fin question
    // ==============================================================

    [[self window] makeKeyAndVisible];
    
    [tab release];
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
