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

    NSAssert(self.storyboardName.length > 0, @"storyboardId is required");

    NSBundle *bundle = [NSBundle mainBundle];
    if (self.bundleIdentifier)
    {
        bundle = [NSBundle bundleWithIdentifier:self.bundleIdentifier];
    }

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardName
                                                         bundle:bundle];
    NSAssert(storyboard != nil, @"Loading storyboard %@ from bundle %@ failed", self.storyboardName, self.bundleIdentifier);

    UIViewController *viewController;

    if (self.referencedIdentifier.length > 0)
    {
        viewController = [storyboard instantiateViewControllerWithIdentifier:self.referencedIdentifier];
        NSAssert(viewController != nil, @"Failed to instantiate view controller with identifier", self.referencedIdentifier);
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
