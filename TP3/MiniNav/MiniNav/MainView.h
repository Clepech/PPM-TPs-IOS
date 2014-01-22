//
//  MainView.h
//  MiniNav
//
//  Created by m2sar on 02/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView <UIWebViewDelegate, UIAlertViewDelegate>{
    UIToolbar *barre;
    UIWebView *web;
    UIImageView *background;
    
    UIBarButtonItem *next;
    UIBarButtonItem *prev;
    UIBarButtonItem *refresh;
    UIBarButtonItem *act;
    UIBarButtonItem *compose;
    UIBarButtonItem *spaceLeft;
    UIBarButtonItem *spaceRight;
    UIAlertView *alert;
    NSURL *homepage;
}

- (void) setFromOrientation:(UIInterfaceOrientation) o;
@end
