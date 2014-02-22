//
//  KMSpinner.m
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import "KMSpinner.h"

@implementation KMSpinner
@synthesize recognizer;
@synthesize path;
@synthesize inertiaeffect;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.inertiaeffect = YES;
//        UIImageView * ime = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"compass.png"]];
//        [self addSubview:ime];
//        ime.frame = self.bounds;
        self.recognizer = [[CDCircleGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [self addGestureRecognizer:self.recognizer];
    }
    return self;
}
-(void) tapped: (CDCircleGestureRecognizer *) arecognizer{
    if (arecognizer.ended == NO) {
        CGPoint point = [arecognizer locationInView:self];
        if ([path containsPoint:point] == NO) {
            
            [self setTransform:CGAffineTransformRotate([self transform], [arecognizer rotation])];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
