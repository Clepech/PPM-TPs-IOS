//
//  StationTableViewController.m
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "StationTableViewController.h"
#import "MyTools.h"
#import "StationCell.h"
#import "PlaneteViewController.h"

#define STATIONNB 20

/* //A quoi ça sert???
@interface StationTableViewController ()
@end
*/
UIImage *vadorImg;
UIImage *leiaImg;
NSMutableArray *stations;

@implementation StationTableViewController
@synthesize side;

-(id) initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:(UITableViewStyle)style];
    if (self) {        
        UIImage *img = [MyTools resizeToSquare:[UIImage imageNamed:@"map.png"] ofSize:30];
        UITabBarItem *tabBar = [[UITabBarItem alloc] initWithTitle:@"Stations" image:img tag:1];
        [self setTabBarItem:tabBar];
        
        // Construction des données
        stations =  [[NSMutableArray alloc] init];
        //[stations addObject:[[NSMutableArray alloc] init]];
        int i;
        for (i = 0; i <STATIONNB; i++) {
            //[[stations objectAtIndex:0] addObject:[[StationCell alloc] initWithIndex:i]];
            [stations addObject:[[StationCell alloc] initWithIndex:i]];
        }
        
        vadorImg = [UIImage imageNamed:@"vador.png"];
        [vadorImg retain];
        leiaImg = [UIImage imageNamed:@"leia.png"];
        [leiaImg retain];
        
        [[self navigationItem] setTitle:@"Stations"];
        
        side = YES; // Coté bon par défaut
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style andSide:(BOOL)newSide{
    self = [self initWithStyle:style];
    if(self){
        side = newSide;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [[self tableView] reloadData];
}

- (void) setSide:(BOOL)newSide{
    side = newSide;
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = [indexPath row];
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@""];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
    }
    StationCell *station = [stations objectAtIndex:index];
    
    [[cell textLabel] setText:[station name]];
    if ([station isJedi]) {
        [[cell textLabel] setTextColor:[UIColor blueColor]];
        [[cell imageView] setImage:leiaImg];
        if (side) {
            [[cell detailTextLabel] setText:@"Accès"];
        }else{
            [[cell detailTextLabel] setText:@"Pas d'accès"];
        }
        
    }else{
        [[cell textLabel] setTextColor:[UIColor redColor]];
        [[cell imageView] setImage:vadorImg];
        if (side) {
            [[cell detailTextLabel] setText:@"Pas d'accès"];
        }else{
            [[cell detailTextLabel] setText:@"Accès"];
        }
    }
    

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [stations  count];
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PlaneteViewController *p = nil;
    if (side == [[stations objectAtIndex:[indexPath row]] isJedi]) {
        p = [[PlaneteViewController alloc] initWithindex:[indexPath row]];
        [[self navigationController] pushViewController:p animated:YES];
        [p release];
    }

}


- (void)dealloc{
    [vadorImg release];
    vadorImg = nil;
    [leiaImg release];
    leiaImg = nil;
    [stations release];
    stations = nil;
    [super dealloc];
}
@end
