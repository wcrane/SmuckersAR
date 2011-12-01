//
//  valViewController.m
//  SmuckersAR
//
//  Created by Tom Hoag on 11/11/11.
//  Copyright (c) 2011 Valassis. All rights reserved.
//

#import "valViewController.h"

#import "AKViewController.h"

@implementation valViewController

@synthesize aurasmaController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) dealloc {
    
    aurasmaController.delegate = nil;
    //[aurasmaController release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)startButtonPushed:(id)sender {
    
    // create the AR VC and present the view modally
    if( !self.aurasmaController )
    {
        self.aurasmaController = [AKViewController aurasmaViewControllerWithDelegate:self];
        
        if (self.aurasmaController)
        {
            //self.aurasmaController.showsCloseButton = showCloseButton;
            self.aurasmaController.delayGuide = YES;
            [self presentModalViewController:self.aurasmaController animated:YES];
        }
        else
            [[[UIAlertView alloc] initWithTitle:@"Alert"
                                         message:@"AurasmaKit not supported on this architecture"
                                        delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil] show];
    }
    
}

#pragma mark -
#pragma mark AKViewControllerDelegate

- (void)aurasmaViewControllerDidClose:(AKViewController*)aurasmaViewController
{
    self.aurasmaController.delegate = nil;
    self.aurasmaController = nil;
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void) aurasmaViewController:(AKViewController*)aurasmaViewController didLoadOverlayView:(UIView*)overlayView
{
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    
    //    button.frame  = CGRectMake(0., 0., 150.0, overlayView.bounds.size.height);
    //    [button setTitle: @"Press me!" forState:UIControlStateNormal];
    //    
    //    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //    
    //    [overlayView addSubview:button];
}

@end
