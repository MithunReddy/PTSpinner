//
//  KMRotaryView.h
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMRotaryProtocol.h"
@interface KMRotaryView : UIControl
@property (weak) id <KMRotaryProtocol> delegate;
@property (nonatomic, strong) UIView *container;
@property int numberOfSections;
- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;
- (void)drawWheel;

@end
