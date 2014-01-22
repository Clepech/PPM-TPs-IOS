//
//  UserTableViewController.m
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "UserTableViewController.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController{
    MoodSelectionViewController *moodVC;
    
    NSMutableArray *moodsTab;
    NSNetService *myService;
    NSNetServiceBrowser *myBrowser;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        moodsTab = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMood:) name:@"moodChanged" object:nil];
    
    [[self navigationItem] setTitle:@"iMoods"];
    UIBarButtonItem *but = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showSelector:)];
    [[self navigationItem] setRightBarButtonItem:but];
    [but release];

    myService = [[NSNetService alloc] initWithDomain:@"local" type:@"_moods._tcp" name:@"Bucket" port:9090];
    [myService setDelegate:self];
    [myService setIncludesPeerToPeer:YES];
    [myService startMonitoring];
    [myService publish];
    
    NSString *baseMood = @"Envie de KFC";
    NSDictionary *dico = [NSDictionary dictionaryWithObject:[baseMood dataUsingEncoding:NSUTF8StringEncoding] forKey:@"mood"];
    [myService setTXTRecordData:[NSNetService dataFromTXTRecordDictionary:dico]];
    
    myBrowser = [[NSNetServiceBrowser alloc] init];
    [myBrowser setDelegate:self];
    [myBrowser searchForServicesOfType:@"_moods._tcp" inDomain:@"local"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showSelector:(id)sender{
    moodVC = [[MoodSelectionViewController alloc] initWithNibName:nil bundle:nil];
    [[self navigationController] pushViewController:moodVC animated:YES];
}

- (void)changeMood:(NSNotification*)notif{
    NSString *mood = [notif object];
    NSDictionary *dico = [NSDictionary dictionaryWithObject:[mood dataUsingEncoding:NSUTF8StringEncoding] forKey:@"mood"];
    [myService setTXTRecordData:[NSNetService dataFromTXTRecordDictionary:dico]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [moodsTab count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    MoodCell *mc = [moodsTab objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[mc name]];
    [[cell detailTextLabel] setText:[mc mood]];
    
    return cell;
}



#pragma mark - Service Delegate

- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data{
    if (data == nil) {
        NSLog(@"pas de données");
    }

    NSData *moodData = [[NSNetService dictionaryFromTXTRecordData:data] objectForKey:@"mood"];
    if (moodData == nil) {
        NSLog(@"Pas d'objet pour la clé mood de l'user %@", [sender name]);
    }
    NSString *mood = [[NSString alloc] initWithData:moodData encoding:NSUTF8StringEncoding];
    if (mood == nil) {
        NSLog(@"impossible de récuperer la mood");
    }
    for (MoodCell *mc in moodsTab) {
        if ([[mc name] isEqualToString:[sender name]]) {
            [mc setMood:mood];
        }
    }
    [[self tableView] reloadData];
    //[mood release];
}

#pragma mark - Browser Delegate

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing{
    [aNetService startMonitoring];
    [aNetService setDelegate:self];
    [aNetService retain];
    
    MoodCell *mc= [[MoodCell alloc] init];
    [mc setName:[aNetService name]];
    [mc setMood:@"Unknow"];
    [moodsTab addObject:mc];
    [[self tableView] reloadData];
    [mc release];
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing{
    MoodCell *obj;
    for (MoodCell *mc in moodsTab) {
        if ([[mc name] isEqualToString:[aNetService name]]) {
            obj = mc;
        }
    }
    [moodsTab removeObject:obj]; //Obligé de faire à l'exterieur sinon Exception
    [[self tableView] reloadData];
    [aNetService stopMonitoring];
    //[aNetService release];
}

- (void) dealloc{
    [myService release];
    [myBrowser release];
    [moodsTab release];
    [super dealloc];
}
@end
