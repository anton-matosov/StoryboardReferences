//
//  StoryboardReferenceViewController.m
//  StoryboardReferences
//
//  Created by Anton Matosov [CTR] on 9/27/15.
//  Copyright © 2015 RPxCopter Team. All rights reserved.
//

#import "StoryboardReferenceViewController.h"

@implementation StoryboardReferenceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSAssert(self.storyboardId.length > 0, @"storyboardId is required");

    NSBundle *bundle = [NSBundle mainBundle];
    if (self.bundle)
    {
        bundle = [NSBundle bundleWithIdentifier:self.bundle];
    }

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardId
                                                         bundle:bundle];
    NSAssert(storyboard != nil, @"Loading storyboard %@ from bundle %@ failed", self.storyboardId, self.bundle);

    UIViewController *viewController;

    if (self.viewControllerId.length > 0)
    {
        viewController = [storyboard instantiateViewControllerWithIdentifier:self.viewControllerId];
        NSAssert(viewController != nil, @"Failed to instantiate view controller with identifier", self.viewControllerId);
    }
    else
    {
        viewController = [storyboard instantiateInitialViewController];
        NSAssert(viewController != nil, @"Failed to instantiate initial view controller");
    }

    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    
    viewController.view.frame = self.view.frame;
    viewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    [viewController didMoveToParentViewController:self];
}

@end
