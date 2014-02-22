//
//  KMViewController.m
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import "KMViewController.h"
#import "CDCircleOverlayView.h"
#import "KMSpinner.h"

@interface KMViewController ()
{
    UILabel* m_label;
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
    spinnerView.layer.cornerRadius = 120;
    UIImageView *imgV = [[UIImageView alloc]init];
    imgV.image = [UIImage imageNamed:@"icon_arrow_up.png"];
    [spinnerView addSubview:imgV];
    imgV.frame = CGRectMake(110, 10, 20, 30);
    
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
    circleView3.backgroundColor = [UIColor greenColor];
    
   
    [self.view addSubview:circleView1];
    [self.view addSubview:spinnerView];
    [spinnerView addSubview:circleView3];
    
   
    
    m_label = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 90, 30)];
    m_label.backgroundColor = [UIColor whiteColor];
    //[spinnerView addSubview:m_label];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
