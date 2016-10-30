//
//  FlipsideViewController.h
//  The Crazy Game
//
//  Created by Thibault Dardinier on 01/06/11.
//  Copyright 2011 Aucune. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Math.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController <UIAccelerometerDelegate> {

    UIAccelerometer *accelerometer;
    IBOutlet UILabel *cadre;
    IBOutlet UILabel *progressif;
    IBOutlet UILabel *pourcent;
    IBOutlet UILabel *etat;
    IBOutlet UILabel *palissade;
    IBOutlet UIButton *reprendrer;
    IBOutlet UIButton *quitter;
    IBOutlet UIButton *recommencement;
    
    IBOutlet UILabel *barriere;
    IBOutlet UILabel *info_avant_jouer;
    IBOutlet UIImageView *cube;
    IBOutlet UITextView *discours;
    IBOutlet UIButton *letsgo;
    IBOutlet UIButton *quitter_discours;
    
    int level;
    int objectif;
    int gagne;
    int perdu;
    int stop;
    int pause;
    double timescore;
    
    double coeff_x_C;
    double coeff_y_C;
    double coeff_x_P;
    double coeff_y_P;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)pause:(id)sender;

-(IBAction)cestparti:(id)sender;
-(IBAction)reprendre:(id)sender;

-(void)cinematique:(int)niveau:(int)difficulte;
-(void)initwithSettings:(int)niveau:(int)difficulte;
-(IBAction)recommencer;
-(double)intervalle:(double)min:(double)max:(double)valeur;

@property (nonatomic, retain) IBOutlet UILabel *cadre;
@property (nonatomic, retain) IBOutlet UILabel *progressif;
@property (nonatomic, retain) IBOutlet UILabel *pourcent;
@property (nonatomic, retain) IBOutlet UILabel *etat;

@property (nonatomic, retain) IBOutlet UILabel *barriere;
@property (nonatomic, retain) IBOutlet UILabel *info_avant_jouer;
@property (nonatomic, retain) IBOutlet UIImageView *cube;
@property (nonatomic, retain) IBOutlet UITextView *discours;
@property (nonatomic, retain) IBOutlet UIButton *letsgo;
@property (nonatomic, retain) IBOutlet UIButton *quitter_discours;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end
