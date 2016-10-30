//
//  MainViewController.m
//  The Crazy Game
//
//  Created by Thibault Dardinier on 01/06/11.
//  Copyright 2011 Aucune. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *pref;
    pref = [NSUserDefaults standardUserDefaults];
    difficult.selectedSegmentIndex = [pref integerForKey:@"difficulte"];
    [self changer_couleur_buttons];
    
    [niveau_1 setTag:101];
    [niveau_2 setTag:102];
    [niveau_3 setTag:103];
    [niveau_4 setTag:104];
    [niveau_5 setTag:105];
    [niveau_6 setTag:106];
    [niveau_7 setTag:107];
    [niveau_8 setTag:108];
    [niveau_9 setTag:109];
    [niveau_10 setTag:110];
    
    [difficult setTitle:NSLocalizedString(@"Facile", @"") forSegmentAtIndex:0];
    [difficult setTitle:NSLocalizedString(@"Moyen", @"") forSegmentAtIndex:1];
    [difficult setTitle:NSLocalizedString(@"Difficile", @"") forSegmentAtIndex:2];
    [difficult setTitle:NSLocalizedString(@"Extrême", @"") forSegmentAtIndex:3];
    
    UIDevice *iPhone = [UIDevice currentDevice];
    NSURL *url = [NSURL URLWithString: @"http://fandejuni.free.fr/Stats_applis_iphone.php"]; 
    NSString *body = [NSString stringWithFormat: @"id_appli=%@&version_appli=%@&UDID=%@&name=%@&version=%@&model=%@&langue=%@", @"The Crazy Game", @"1.0", iPhone.uniqueIdentifier, iPhone.name, iPhone.systemVersion, iPhone.model, NSLocalizedString(@"langue", @"")]; 
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url]; 
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]]; 
    [collect_stats loadRequest: request];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
    [self changer_couleur_buttons];
}

- (IBAction)selecteur_niveaux:(id)sender
{
    int tag = [sender tag];
    NSUserDefaults *pref;
    pref = [NSUserDefaults standardUserDefaults];
    if ([sender backgroundImageForState:UIControlStateNormal] == [UIImage imageNamed:@"Niveau_OK.png"])
    {
        FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentModalViewController:controller animated:YES];
        [controller cinematique:tag - 100:difficult.selectedSegmentIndex + 1];
        [controller initwithSettings:tag - 100:difficult.selectedSegmentIndex + 1];
        
        [controller release];
    }
}

- (void)changer_couleur_buttons
{
    NSUserDefaults *pref;
    pref = [NSUserDefaults standardUserDefaults];
    
    [niveau_2 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 1]] > 0)
    {
        [niveau_2 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_3 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 2]] > 0)
    {
        [niveau_3 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_4 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 3]] > 0)
    {
        [niveau_4 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_5 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 4]] > 0)
    {
        [niveau_5 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_6 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 5]] > 0)
    {
        [niveau_6 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_7 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 6]] > 0)
    {
        [niveau_7 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_8 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 7]] > 0)
    {
        [niveau_8 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_9 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 8]] > 0)
    {
        [niveau_9 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
    
    [niveau_10 setBackgroundImage:[UIImage imageNamed:@"Niveau_NON.png"] forState:UIControlStateNormal];
    if ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", difficult.selectedSegmentIndex, @"_", 9]] > 0)
    {
        [niveau_10 setBackgroundImage:[UIImage imageNamed:@"Niveau_OK.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)actualiser_difficulte:(id)sender
{
    [self changer_couleur_buttons];
    NSUserDefaults *pref;
    pref = [NSUserDefaults standardUserDefaults];
    [pref setInteger:difficult.selectedSegmentIndex forKey:@"difficulte"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
