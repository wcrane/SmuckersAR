//
//  AKViewController.h
//  AurasmaKit
//
//  Created by Matt Harper on 4/4/11.
//  Copyright 2011 Autonomy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKConfig.h"

@class AKViewController;
@protocol AKViewControllerDelegate <NSObject>

@required
- (void)aurasmaViewControllerDidClose:(AKViewController*)aurasmaViewController;

@optional
- (void)aurasmaViewController:(AKViewController*)aurasmaViewController didLoadOverlayView:(UIView*)overlayView;

@end


@interface AKViewController : UIViewController 
{
    id                      delegate;
    
    BOOL                    delayGuide;
    BOOL                    showsCloseButton;
}

@property (nonatomic, assign) id<AKViewControllerDelegate> delegate;
@property (nonatomic) BOOL delayGuide;
@property (nonatomic) BOOL showsCloseButton;

//
// Designated Creator
//

+ (AKViewController*)aurasmaViewControllerWithDelegate: (id)delegate;
+ (AKViewController*)aurasmaViewControllerWithClearCache: (BOOL) clear delegate:(id)delegate;

- (BOOL)presentOverlayViewController:(UIViewController*)viewController animated:(BOOL)animated;
- (void)dismissOverlayViewControllerAnimated:(BOOL)animated;

- (void)addButtonWithTarget:(id)target action:(SEL)action image:(UIImage*)image selectedImage:(UIImage*)selectedImage;

- (BOOL)setColor:(UIColor*)color forConfigColor:(AKConfigColor)configColor;
- (BOOL)setBackgroundImage:(UIImage*)image withContentMode:(UIViewContentMode)contentMode;

+ (void)unpackResources; // Synchronous

@end
