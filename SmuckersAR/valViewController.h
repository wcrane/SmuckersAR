//
//  valViewController.h
//  SmuckersAR
//
//  Created by Tom Hoag on 11/11/11.
//  Copyright (c) 2011 Valassis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKViewController.h"


@interface valViewController : UIViewController <AKViewControllerDelegate> {

AKViewController *aurasmaController;

}

@property (nonatomic, retain) AKViewController *aurasmaController;

- (IBAction)startButtonPushed:(id)sender;

@end
