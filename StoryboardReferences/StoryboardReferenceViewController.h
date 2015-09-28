//
//  StoryboardReferenceViewController.h
//  StoryboardReferences
//
//  Created by Anton Matosov [CTR] on 9/27/15.
//  Copyright © 2015 RPxCopter Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryboardReferenceViewController : UIViewController

@property (strong, nonatomic) IBInspectable NSString* storyboardId;
@property (strong, nonatomic) IBInspectable NSString* viewControllerId;
@property (strong, nonatomic) IBInspectable NSString* bundle;

@end
