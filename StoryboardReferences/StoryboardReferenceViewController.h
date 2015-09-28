//
//  StoryboardReferenceViewController.h
//  StoryboardReferences
//
//  Created by Anton Matosov [CTR] on 9/27/15.
//  Copyright © 2015 RPxCopter Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryboardReferenceViewController : UIViewController

@property (strong, nonatomic) IBInspectable NSString *storyboardName;
@property (strong, nonatomic) IBInspectable NSString *referencedIdentifier;
@property (strong, nonatomic) IBInspectable NSString *bundleIdentifier;

@end
