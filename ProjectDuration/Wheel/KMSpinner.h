//
//  KMSpinner.h
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDCircleGestureRecognizer.h"
@interface KMSpinner : UIView
@property(nonatomic,strong)CDCircleGestureRecognizer *recognizer;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, assign) BOOL inertiaeffect;

@end
