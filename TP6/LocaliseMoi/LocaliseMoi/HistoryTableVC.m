//
//  HistoryTableVC.m
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "HistoryTableVC.h"

@interface HistoryTableVC ()

@end

@implementation HistoryTableVC{
    NSString *savPath;
    NSMutableArray *addrCellTab;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {        
        [self setTabBarItem:[[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1] autorelease]];
        
        [[self navigationItem] setTitle:@"Historique"];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
        UIBarButtonItem *but = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(makePersistant:)];
        [[self navigationItem] setRightBarButtonItem:but];
        [but release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAddress:) name:@"addressAdded" object:nil];
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    savPath =[[dir objectAtIndex:0] stringByAppendingString:@"/addressList"];
    [savPath retain];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:savPath]) {
        addrCellTab = [[NSKeyedUnarchiver unarchiveObjectWithFile:savPath] retain];
    }else{
        addrCellTab = [[NSMutableArray alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addAddress:(NSNotification*)notif{
    [addrCellTab addObject:[notif object]];
    [[self tableView] reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [addrCellTab count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Address";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int index = [indexPath row];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Address"];
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"Adresse %d", index+1]];
    [[cell detailTextLabel] setText:[[addrCellTab objectAtIndex:index] name]];
    //[[cell ]]
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [addrCellTab removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Pas supporté
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    NSLog(@"Index depart : %d, arrive : %d", [fromIndexPath row], [toIndexPath row]);
    AddressCell *obj = [addrCellTab objectAtIndex:[fromIndexPath row]];
    [obj retain];
    [addrCellTab removeObjectAtIndex:[fromIndexPath row]];
    [addrCellTab insertObject:obj atIndex:[toIndexPath row]];
    [[self tableView] reloadData];
    [obj release];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO
    return YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_mapVC goTo:[addrCellTab objectAtIndex:[indexPath row]]];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}
/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)makePersistant:(id)sender{    
    NSLog(@"Dossier de sauvegarde : %@", savPath);
    [NSKeyedArchiver archiveRootObject:addrCellTab toFile:savPath];
}

- (void) dealloc{
    [savPath release];
    [addrCellTab release];
    [super dealloc];
}

@end
