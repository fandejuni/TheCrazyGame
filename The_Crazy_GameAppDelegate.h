//
//  The_Crazy_GameAppDelegate.h
//  The Crazy Game
//
//  Created by Thibault Dardinier on 01/06/11.
//  Copyright 2011 Aucune. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface The_Crazy_GameAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
