//
//  KMRotaryView.m
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import "KMRotaryView.h"
#import <QuartzCore/QuartzCore.h>
@implementation KMRotaryView
@synthesize delegate,container,numberOfSections;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self drawWheel];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
}
- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;{
//    [self drawWheel];
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self drawWheel];
    }
    return self;

   // return nil;
}
- (void)drawWheel
{
    container = [[UIView alloc] initWithFrame:self.frame];
    // 2
    CGFloat angleSize = 2*M_PI/numberOfSections;
    // 3
    for (int i = 0; i < numberOfSections; i++) {
        // 4
        UILabel *im = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        im.backgroundColor = [UIColor redColor];
        im.text = [NSString stringWithFormat:@"%i", i];
        im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
        // 5
        im.layer.position = CGPointMake(container.bounds.size.width/2.0,
                                        container.bounds.size.height/2.0);
        im.transform = CGAffineTransformMakeRotation(angleSize * i);
        im.tag = i;
        // 6
        [container addSubview:im];
    }
    // 7
    container.userInteractionEnabled = NO;
    [self addSubview:container];
}

@end
