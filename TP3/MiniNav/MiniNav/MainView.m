//
//  MainView.m
//  MiniNav
//
//  Created by m2sar on 02/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "MainView.h"

#define BARREH 50
#define WEBEDGE 15

@implementation MainView

bool isIos6;
bool isIPad;
bool isHomepage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    if (self) {
        
        //[self setBackgroundColor:[UIColor clearColor]];
        
        // Test des version
        if ([[[UIDevice currentDevice] systemVersion] characterAtIndex:(0)] == '6') {
            isIos6 = YES;
        }else{
            isIos6 = NO;
        }
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            isIPad = NO;
        }else{
            isIPad = YES;
        }
        

        background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fond-2048x2048.jpg"]];
        [self addSubview:background];
        
        [self addSubview:background];
        //[background release];
        // Initialisation des sous-vues
        double curY = 0;
        if (!isIos6) {
            curY += 20;
        }
        double screenW = frame.size.width;
        double screenH = frame.size.height;
        
        barre = [[UIToolbar alloc] initWithFrame:CGRectMake(0, curY, screenW, BARREH)];
        curY += BARREH;
        
        refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:@selector(goHome:)];
        
        spaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:@selector(alloc)];
        
        prev = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:nil action:@selector(goPrev:)];
        
        act = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:@selector(goToURL:)];
        
        spaceRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:@selector(alloc)];
        
        next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:@selector(goNext:)];
        
        compose = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:@selector(setHomeURL:)];
        
        [barre setItems:[NSArray arrayWithObjects:refresh, spaceLeft, prev, act, next, spaceRight, compose, nil]];
        
        
        curY += WEBEDGE;
        web = [[UIWebView alloc] initWithFrame:CGRectMake(WEBEDGE, curY , screenW - 2 * WEBEDGE, screenH - curY - WEBEDGE)];
        [web setScalesPageToFit:YES];
        

        alert = [[UIAlertView alloc] initWithTitle:@"Entrer un URL" message:@"" delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"GO", nil];
        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput ];
        
        [web setDelegate:self];
        [self addSubview:barre];
        [self addSubview:web];
        
        homepage = [NSURL URLWithString:@"http://www.upmc.fr" ];
        [homepage retain];
        
        NSURLRequest *req = [NSURLRequest requestWithURL:homepage];
        [web loadRequest:req];
        
        [background release];
        [web release];
        [refresh release];
        [spaceLeft release];
        [prev release];
        [spaceRight release];
        [next release];
        [compose release];
        [barre release];
         
    }
    return self;
}

- (void) setFromOrientation:(UIInterfaceOrientation) o {
    double curY = 0;
    if (!isIos6) {
        curY += 20;
    }
    double screenW = [self bounds].size.width;
    double screenH = [self bounds].size.height;
    
    [barre setFrame:CGRectMake(0, curY, screenW, BARREH)];
    curY += BARREH;
    curY += WEBEDGE;
    [web setFrame:CGRectMake(WEBEDGE, curY , screenW - 2 * WEBEDGE, screenH - curY - WEBEDGE)];
}

- (void) goPrev:(UIBarButtonItem*)sender{
    [web goBack];
}

- (void) goNext:(UIBarButtonItem*)sender{
    [web goForward];
}

- (void) setHomeURL:(UIBarButtonItem*)sender{
    isHomepage = YES;
    [alert show];
}

- (void) goToURL:(UIBarButtonItem*)sender{
    isHomepage = NO;
    [alert show];
}

- (void) goHome:(UIBarButtonItem*)sender{
    NSURLRequest *req = [NSURLRequest requestWithURL:homepage];
    [web loadRequest:req];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if(! [webView canGoBack]){
        [prev setEnabled:NO];
    }else{
        [prev setEnabled:YES];
    }
    if(! [webView canGoForward]){
        [next setEnabled:NO];
    }else{
        [next setEnabled:YES];
    }
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSURL *tmpURL;
    
    if (buttonIndex == 1) {
         tmpURL = [NSURL URLWithString:[[alertView textFieldAtIndex:0] text]];
        if (isHomepage) {
            [homepage release];
            homepage = tmpURL;
            [homepage retain];
        }else{
            NSURLRequest *req = [NSURLRequest requestWithURL:tmpURL];
            [web loadRequest:req];
        }
    }
}


- (void) dealloc{
    [homepage release];
    [alert release];
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
