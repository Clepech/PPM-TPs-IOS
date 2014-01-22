//
//  MapViewController.m
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//


#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController{
    NSMutableData *myData;
    CLLocationCoordinate2D coord;
    BOOL isFirstlocation;
    BOOL isInLat;
    BOOL isInLng;
    NSMutableString *tmp;
    MapView *view;
    UILocalNotification *notif;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *img = [MyTools resizeToSquare:[UIImage imageNamed:@"icone-terre.png"] ofSize:30];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Localisation" image:img tag:1];
        [self setTabBarItem:tbi];
        
        [tbi release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UI part
    
    NSLog(@"[[UIScreen mainScreen] bounds] x=%f y=%f w=%f h=%f", [[UIScreen mainScreen] bounds].origin.x, [[UIScreen mainScreen] bounds].origin.y, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    NSLog(@"[[self view] bounds] x=%f y=%f w=%f h=%f", [[self view] bounds].origin.x, [[self view] bounds].origin.y, [[self view] bounds].size.width, [[self view] bounds].size.height);
    
    view = [[MapView alloc] initWithFrame:[[self view] bounds]];
    [self setView:view];
    
    [[self navigationItem] setTitle:@"Localisation"];
    
    [[view text] setDelegate:self];
    
    /*
    UISearchBar *search = [[UISearchBar alloc] init];
    [[self navigationItem] setTitleView:search];
    [search release];
    //*/
    [view release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [view setOrientation];
}

- (void)goTo:(AddressCell *)addr{
    MKCoordinateRegion reg;
    reg.center = addr.coord;
    reg.span.latitudeDelta = 0.05;
    reg.span.longitudeDelta = 0.05;
    [[view map] setRegion:reg];
    
    UILocalNotification *locNotif = [[UILocalNotification alloc] init];
    
    [locNotif setAlertAction:@"Ajout Adresse"];
    [locNotif setAlertBody:[NSString stringWithFormat:@"Déplacement à %@", [addr name]]];
    [[UIApplication sharedApplication] presentLocalNotificationNow:locNotif];
    [locNotif release];

}

#pragma mark - TextView methods

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSString *str = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/xml?address=%@&sensor=false", [textView text]];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    // TODO gerer les caractere à la cons du style retour à la ligne
    NSURL *url = [NSURL URLWithString:str];
    NSLog(@"%@", str);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [request release];
    
    myData = [[NSMutableData alloc] init];
}

#pragma mark - Connection methods

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [myData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"erreur de connexion");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Erreur de connexion" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // On lance le parsing
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:myData];
    [parser setDelegate:self];
    
    if (! [parser parse]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Parsing : Impossible de recuperer les coordonnees" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

#pragma mark - Parsing methods

- (void) parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"start parsing");
    isFirstlocation = NO;
    isInLat = NO;
    isInLng = NO;
    tmp = [[NSMutableString alloc] init];
}

- (void) parserDidEndDocument:(NSXMLParser *)parser{
    [tmp release];
    NSLog(@"End parsing");
    NSLog(@"Coordonnée : lat=%f longi=%f", coord.latitude, coord.longitude);
    //[self goTo:coord];
    AddressCell *addr = [[AddressCell alloc] initWithName:[[view text] text] andCoordinates:coord];
    [self goTo:addr];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addressAdded" object:addr];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //NSLog(@"Lecture balise : %@", elementName);
    if ([elementName isEqualToString:@"location"]) {
        isFirstlocation = YES;
    }
    if ([elementName isEqualToString:@"lat"] && isFirstlocation) {
        isInLat = YES;
        [tmp setString:@""];
    }
    if ([elementName isEqualToString:@"lng"] && isFirstlocation){
        isInLng = YES;
        [tmp setString:@""];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"location"]) {
        isFirstlocation = NO;
    }
    if ([elementName isEqualToString:@"lat"] && isFirstlocation) {
        isInLat = NO;
        coord.latitude = [tmp doubleValue];
    }
    if ([elementName isEqualToString:@"lng"] && isFirstlocation){
        isInLng = NO;
        coord.longitude = [tmp doubleValue];
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(isInLng || isInLat){
        [tmp appendString:string];
        NSLog(@"lu : %@", tmp);
    }
}


@end
