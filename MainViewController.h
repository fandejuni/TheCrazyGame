//
//  MainViewController.h
//  The Crazy Game
//
//  Created by Thibault Dardinier on 01/06/11.
//  Copyright 2011 Aucune. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    
    IBOutlet UISegmentedControl *difficult;
    IBOutlet UIButton *niveau_1;
    IBOutlet UIButton *niveau_2;
    IBOutlet UIButton *niveau_3;
    IBOutlet UIButton *niveau_4;
    IBOutlet UIButton *niveau_5;
    IBOutlet UIButton *niveau_6;
    IBOutlet UIButton *niveau_7;
    IBOutlet UIButton *niveau_8;
    IBOutlet UIButton *niveau_9;
    IBOutlet UIButton *niveau_10;
    
    IBOutlet UIWebView *collect_stats;
}


- (IBAction)selecteur_niveaux:(id)sender;
- (IBAction)actualiser_difficulte:(id)sender;
- (void)changer_couleur_buttons;

@end
