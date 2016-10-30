//
//  FlipsideViewController.m
//  The Crazy Game
//
//  Created by Thibault Dardinier on 01/06/11.
//  Copyright 2011 Aucune. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate=_delegate;

@synthesize cadre;
@synthesize progressif;
@synthesize pourcent;
@synthesize etat;

@synthesize barriere;
@synthesize info_avant_jouer;
@synthesize cube;
@synthesize discours;
@synthesize letsgo;
@synthesize quitter_discours;

@synthesize accelerometer;

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    timescore = 0;
    barriere.alpha = 1;
    info_avant_jouer.alpha = 1;
    cube.alpha = 1;
    discours.alpha = 1;
    letsgo.alpha = 1;
    quitter_discours.alpha = 1;
    
    [quitter_discours setTitle:NSLocalizedString(@"Quitter", @"") forState:UIControlStateNormal];
    [quitter setTitle:NSLocalizedString(@"Quitter", @"") forState:UIControlStateNormal];
    [reprendrer setTitle:NSLocalizedString(@"Reprendre", @"") forState:UIControlStateNormal];
    [recommencement setTitle:NSLocalizedString(@"Recommencer le niveau", @"") forState:UIControlStateNormal];
    [letsgo setTitle:NSLocalizedString(@"C'est parti !", @"") forState:UIControlStateNormal];
}

-(void)cinematique:(int)niveau:(int)difficulte
{
    NSString *speech = [NSString stringWithFormat:@"%d", niveau+ 100];
    discours.text = NSLocalizedString(speech, @"");
    barriere.alpha = 1;
    info_avant_jouer.alpha = 1;
    cube.alpha = 1;
    discours.alpha = 1;
    letsgo.alpha = 1;
    quitter_discours.alpha = 1;
    stop = 1;
    level = niveau;
    objectif = 80;
    info_avant_jouer.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), niveau, NSLocalizedString(@"Facile", @"")];
    if (difficulte == 2) {
        objectif = 88;
        info_avant_jouer.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), niveau, NSLocalizedString(@"Moyen", @"")];
    }
    else if (difficulte == 3) {
        objectif = 96; 
        info_avant_jouer.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), niveau, NSLocalizedString(@"Difficile", @"")];
    }
    else if (difficulte == 4) {
        objectif = 100;
        info_avant_jouer.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), niveau, NSLocalizedString(@"Extrême", @"")];
    }
    if (level == 11) {
        NSString *speech = [NSString stringWithFormat:@"%d", niveau + 102 + difficulte];
        discours.text = NSLocalizedString(speech, @"");
        letsgo.alpha = 0;
        info_avant_jouer.alpha = 0;
    }
}

-(IBAction)cestparti:(id)sender
{
    [self recommencer];
}

-(void)recommencer
{
    barriere.alpha = 0;
    info_avant_jouer.alpha = 0;
    cube.alpha = 0;
    discours.alpha = 0;
    letsgo.alpha = 0;
    quitter_discours.alpha = 0;
    stop = 0;
    pause = 0;
    perdu = 0;
    palissade.alpha = 0;
    reprendrer.alpha = 0;
    quitter.alpha = 0;
    recommencement.alpha = 0;
    timescore = 0;
    
    int diff = 1;
    if (objectif == 88) {
        diff = 2;
    }
    else if (objectif == 96) {
        diff = 3;
    }
    else if (objectif == 100) {
        diff = 4;
    }
    cadre.center = CGPointMake(160, 230);
    progressif.center = CGPointMake(210, 280);
    CGRect newFrame = progressif.frame;
    newFrame = progressif.frame;
    if (level == 1)
    {
        newFrame.size.height = 70;
        newFrame.size.width = 70;
        progressif.frame = newFrame;
    }
    else if (level > 1)
    {
        newFrame.size.height = 50;
        newFrame.size.width = 50;
        progressif.frame = newFrame;
    }
}

-(void)initwithSettings:(int)niveau:(int)difficulte
{

    if (timescore > 60) {
        stop = 1;
        gagne = 0;
        perdu = 1;
        pause = 0;
    }
    level = niveau;
    objectif = 80;
    if (difficulte == 2) {
        objectif = 88;
    }
    else if (difficulte == 3) {
        objectif = 96;
    }
    else if (difficulte == 4) {
        objectif = 100;
    }
    coeff_x_C = 1;
    coeff_y_C = 1;
    coeff_x_P = 1;
    coeff_y_P = 1;
    
    
    
    CGPoint coords_C;
    coords_C.x = 160; // 25 295
    coords_C.y = 230; // 270 410
    cadre.center = coords_C;
    
    CGPoint coords_P;
    coords_P.x = 210; // 25 295
    coords_P.y = 280; // 270 410
    progressif.center = coords_P;
    
    CGRect newFrame = progressif.frame;
    newFrame = progressif.frame;
    if (level == 1)
    {
        newFrame.size.height = 70;
        newFrame.size.width = 70;
        progressif.frame = newFrame;
    }
    else if (level > 1)
    {
        newFrame.size.height = 50;
        newFrame.size.width = 50;
        progressif.frame = newFrame;
    }

}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    if (timescore > 60) {
        stop = 1;
        gagne = 0;
        perdu = 1;
        pause = 0;
    }
    

    
        
    self.etat.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), level, NSLocalizedString(@"Facile", @"")];
;
    if (objectif == 88) {
        self.etat.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), level, NSLocalizedString(@"Moyen", @"")];
    }
    else if (objectif == 96) {
        self.etat.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), level, NSLocalizedString(@"Difficile", @"")];
    }
    else if (objectif == 100) {
        self.etat.text = [NSString stringWithFormat:@"%@ %d - %@", NSLocalizedString(@"Niveau", @""), level, NSLocalizedString(@"Extrême", @"")];
    }
    if (stop == 0)
    {
        int coeff = 25;
        int bouge = 1;
        int V = 100;// Vitesse (en pixel / seconde)
        
        if (level == 1)
        {
            coeff = 35;
            bouge = 0;
            V = 50;
        }
        if (level == 2)
        {
            bouge = 0;
            V = 50;
        }
        if (level == 3)
        {
            V = 50;
        }
        if (level == 4)
        {
            V = 100;
        }
        if (level == 5)
        {
            V = 200;
        }
        if (level == 6)
        {
            V = 200;
            coeff_x_C = -1;
            coeff_y_C = -1;
            coeff_x_P = -1;
            coeff_y_P = -1;
        }
        if (level == 7)
        {
            V = 350;
            coeff_x_C = 1;
            coeff_y_C = -1;
            coeff_x_P = 1;
            coeff_y_P = -1;
        }
        if (level == 8)
        {
            V = 500;
            coeff_x_C = -1;
            coeff_y_C = -1;
            coeff_x_P = 1;
            coeff_y_P = 1;
        }
        if (level == 9)
        {
            coeff_x_C = 1;
            coeff_y_C = 1;
            coeff_x_P = -1;
            coeff_y_P = -1;
            
            if ((int) round(timescore * 10) % 5 == 0) 
            {
                V = 150;
            }
            if ((int) round(timescore * 10) % 5 == 1) 
            {
                V = 300;
            }
            if ((int) round(timescore * 10) % 5 == 2) 
            {
                V = 450;
            }
            if ((int) round(timescore * 10) % 5 == 3) 
            {
                V = 600;
            }
            if ((int) round(timescore * 10) % 5 == 4) 
            {
                V = 750;
            }
        }
        if (level == 10)
        {
            coeff_x_C = -1;
            coeff_y_C = -1;
            coeff_x_P = 1;
            coeff_y_P = 1;
            V = arc4random() % 1000;
        }
        if (level == 11)
        {
            coeff_x_C = 1;
            coeff_y_C = 1;
            coeff_x_P = -1;
            coeff_y_P = -1;
            V = arc4random() % 1400;
            cadre.transform = CGAffineTransformMakeRotation((arc4random() % 157) / 100);
        }
        if (level == 12)
        {
            coeff_x_C = -1;
            coeff_y_C = -1;
            coeff_x_P = 1;
            coeff_y_P = 1;
            V = arc4random() % 2000;
        }
        double Y_ = acceleration.y * -1 * coeff_y_C;
        double X_ = acceleration.x * 1 * coeff_x_C;
        double Y_P = acceleration.y * -1 * coeff_y_P;
        double X_P = acceleration.x * 1 * coeff_x_P;

        
        CGPoint coords;
        coords.x = 160; // 25 295
        coords.y = 230; // 270 410
        cadre.center = coords;
        
        timescore += 0.1;
    
    

        if (bouge == 1)
        {
            coords.x = X_* 160 + 160; // 25 295
            coords.y = Y_* 225 + 225; // 270 410
            cadre.center = coords;
        }
        CGPoint coords_P;
        coords_P.x = [self intervalle:coeff:320 - coeff:progressif.center.x + (X_P * V)];
        coords_P.y = [self intervalle:coeff:460 - coeff:progressif.center.y + (Y_P * V)];
        progressif.center = coords_P;
    
        double longueur_C;
        double largeur_C;
        int OK = 1;
        if (level == 1)
        {
            if (coords_P.x > 135)
            {
                largeur_C = (coords_P.x - 35) - 135;
            }
            else if (coords_P.x <= 135)
            {
                largeur_C = (185 - (coords_P.x - 35)) - 70;
            }
        }
        else
        {
            if (coords_P.x > coords.x)
            {
                largeur_C = (coords_P.x - 25) - (coords.x - 25);
            }
            else if (coords_P.x <= coords.x)
            {
                largeur_C = (coords.x - 25) - (coords_P.x - 25);
            }
        }
        if ((largeur_C < 0) && (level == 1))
        {
            largeur_C += 20;
            if (largeur_C > 0) {
                largeur_C = 0;
            }
            else
            {
                largeur_C *= -1;
            }
        }
        if (largeur_C > 50)
        {
            largeur_C = 0;
            OK = 0;
        }
        if (largeur_C < 0)
        {
            largeur_C = 0;
            OK = 0;
        }
        if (level == 1)
        {
            if (coords_P.y > 205)
            {
                longueur_C = (coords_P.y - 35) - 205;
            }
            else if (coords_P.y <= 205)
            {
                longueur_C = (255 - (coords_P.y - 35)) - 70 + 35;
            }
        }
        else
        {
            if (coords_P.y > coords.y)
            {
                longueur_C = (coords_P.y - 25) - (coords.y - 25);
            }
            else if (coords_P.y <= coords.y)
            {
                longueur_C = (coords.y - 25) - (coords_P.y - 25);
            }
        }
        if ((longueur_C < 0) && (level == 1))
        {
            longueur_C += 20;
            if (longueur_C > 0) {
                longueur_C = 0;
            }
            else
            {
                longueur_C *= -1;
            }
        }
        if (longueur_C > 50)
        {
            longueur_C = 0;
            OK = 0;
        }
        if (longueur_C < 0)
        {
            longueur_C = 0;
            OK = 0;
        }
        longueur_C = 50 - longueur_C;
        largeur_C = 50 - largeur_C;
        int pourcentage = (int) round(largeur_C * longueur_C / 25);
        if (OK == 0) {
            pourcentage = 0;
        }
        if (pourcentage >= objectif)
        {
            gagne = 1;
            stop = 1;
        }
        /*
        commun.text = [NSString stringWithFormat:@"%d", (int) round(largeur_C * longueur_C)];
        total.text = [NSString stringWithFormat:@"%d", (int) round(5000 - largeur_C * longueur_C)];
        */
        pourcent.text = [NSString stringWithFormat:@"%d%@%d%@%d%@", (int) timescore, @" s. - ", pourcentage, @" % (", objectif, @" %)"];
    }
    else if (stop == 1)
    {
        int diff = 1;
        if (objectif == 88) {
            diff = 2;
        }
        else if (objectif == 96) {
            diff = 3;
        }
        else if (objectif == 100) {
            diff = 4;
        }
        if (gagne == 1) {
            gagne = 0;
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Félicitations", @"") message:[NSString stringWithFormat:@"%@%d%@%d%@", NSLocalizedString(@"Bravo !\nVous avez terminé le niveau ", @""), level, NSLocalizedString(@" en ", @""), (int) ceil(timescore), NSLocalizedString(@" secondes.", @"")] delegate:self cancelButtonTitle:NSLocalizedString(@"Continuer", "") otherButtonTitles:nil] autorelease];
            [alert show];
            NSUserDefaults *pref;
            pref = [NSUserDefaults standardUserDefaults];
            if (([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", diff - 1, @"_", level]] == 0) || ([pref integerForKey:[NSString stringWithFormat:@"%d%@%d", diff - 1, @"_", level]] > ceil(timescore))) {
                [pref setInteger:ceil(timescore) forKey:[NSString stringWithFormat:@"%d%@%d", diff - 1, @"_", level]];
            }
            [self cinematique:level + 1:diff];
            timescore = 0;
        }
        else if (perdu == 1) {
            perdu = 0;
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Temps dépassé (1 min)", @"") message:[NSString stringWithFormat:@"%@%d%@", NSLocalizedString(@"Désolé !\nVous avez échouez au niveau ", @""), level, @"..."] delegate:self cancelButtonTitle:NSLocalizedString(@"Réessayer", @"") otherButtonTitles:nil] autorelease];
            [alert show];
            [self cinematique:level:diff];
            timescore = 0;
        }
    }
}

- (IBAction)pause:(id)sender
{
    barriere.alpha = 0;
    info_avant_jouer.alpha = 0;
    cube.alpha = 0;
    discours.alpha = 0;
    letsgo.alpha = 0;
    quitter_discours.alpha = 0;
    stop = 1;
    pause = 1;
    palissade.alpha = 0.7;
    reprendrer.alpha = 1;
    quitter.alpha = 1;
    recommencement.alpha = 1;
    
}
-(double)intervalle:(double)min:(double)max:(double)valeur
{
    if (valeur < min)
        return min;
    else if (valeur > max)
        return max;
    else
        return valeur;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)fermer_jeu
{
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.delegate = nil;
    [self.delegate flipsideViewControllerDidFinish:self];
}

-(IBAction)reprendre:(id)sender
{
    stop = 0;
    pause = 0;
    palissade.alpha = 0;
    reprendrer.alpha = 0;
    quitter.alpha = 0;
    recommencement.alpha = 0;
    barriere.alpha = 0;
    info_avant_jouer.alpha = 0;
    cube.alpha = 0;
    discours.alpha = 0;
    letsgo.alpha = 0;
    quitter_discours.alpha = 0;
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self fermer_jeu];
}

@end
