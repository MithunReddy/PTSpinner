//
//  KMViewController.m
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import "KMViewController.h"
#import "CDCircleOverlayView.h"
#import "KMRotaryView.h"
#import "KMSpinner.h"
double wrapd(double _val, double _min, double _max)
{
    if(_val < _min) return _max - (_min - _val);
    if(_val > _max) return _min - (_max - _val);
    return _val;
}
@interface KMViewController ()
{
    UIView* m_block;
    UILabel* m_label;
    CGPoint m_locationBegan;
    float m_currentAngle;
    UIView *circleView;
}
@property(nonatomic,strong)KMSpinner *spinnerView;
@end

@implementation KMViewController
@synthesize spinnerView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    spinnerView = [[KMSpinner alloc]initWithFrame:CGRectMake(40,130,240,240)];
    spinnerView.backgroundColor = [UIColor redColor];
    spinnerView.layer.cornerRadius = 125;

    
    circleView = [[UIView alloc] initWithFrame:CGRectMake(40,130,240,240)];
    circleView.alpha = 0.5;
    circleView.layer.cornerRadius = 125;
    circleView.backgroundColor = [UIColor orangeColor];
    
    UIView *circleView1 = [[UIView alloc] initWithFrame:CGRectMake(10,100,300,300)];
    circleView1.alpha = 1.0;
    circleView1.layer.cornerRadius = 150;
    circleView1.backgroundColor = [UIColor blueColor];
    
    UIView *circleView3 = [[UIView alloc] initWithFrame:CGRectMake(70,70,100,100)];
    circleView3.alpha = 1.0;
    circleView3.layer.cornerRadius = 50;
    circleView3.backgroundColor = [UIColor blackColor];
    
   
    [self.view addSubview:circleView1];
    [self.view addSubview:spinnerView];
   // [circleView addSubview:circleView3];
    
   
    
    m_label = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 90, 30)];
    m_label.backgroundColor = [UIColor whiteColor];
    //[spinnerView addSubview:m_label];

    
}




//- (void) touchesBegan:(NSSet *)_touches withEvent:(UIEvent *)_event
//{
//    UITouch* touch = [_touches anyObject];
//    CGPoint location = [touch locationInView:self.view];
//    m_locationBegan = location;
//}
//
//- (void) touchesMoved:(NSSet *)_touches withEvent:(UIEvent *)_event
//{
//    UITouch* touch = [_touches anyObject];
//    CGPoint location = [touch locationInView:self.view];
//    [self updateRotation:location];
//}
//
//- (void) touchesEnded:(NSSet *)_touches withEvent:(UIEvent *)_event
//{
//    UITouch* touch = [_touches anyObject];
//    CGPoint location = [touch locationInView:self.view];
//    m_currentAngle = [self updateRotation:location];
//}
//
//- (float) updateRotation:(CGPoint)_location
//{
//    float fromAngle = atan2(m_locationBegan.y-m_block.center.y, m_locationBegan.x-m_block.center.x);
//    float toAngle = atan2(_location.y-m_block.center.y, _location.x-m_block.center.x);
//    float newAngle = wrapd(m_currentAngle + (toAngle - fromAngle), 0, 2*3.14);
//    
//    CGAffineTransform cgaRotate = CGAffineTransformMakeRotation(newAngle);
//    circleView.transform = cgaRotate;
//    
//    int oneInFifty = (newAngle*50)/(2*3.14);
//    
//    m_label.text = [NSString stringWithFormat:@"Angle: %f 1in50: %i", newAngle, oneInFifty];
//    
//    return newAngle;
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage *) circle:(CDCircle *)circle iconForThumbAtRow:(NSInteger)row {
    NSString *fileString = [[[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil] lastObject];
    
    return [UIImage imageWithContentsOfFile:fileString];
    
}
-(void) circle:(CDCircle *)circle didMoveToSegment:(NSInteger)segment thumb:(CDCircleThumb *)thumb {
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User did select item" message:[NSString stringWithFormat:@"Segment's tag: %i", segment] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
    
    
}

@end
