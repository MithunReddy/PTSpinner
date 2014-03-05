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
    UIScrollView *scrollView;
    UIView *circleView1;
    UIView *mainView;
    UITextField *textFielddate;
    UIDatePicker *pickerView;
    int i;
    int date;
    int month;
    UIActionSheet   *sheet;
    UILabel *lbl;
    int year;
    UITextField *textFieldnoWeeks;
    NSDate *defaultDate;
}
@property(nonatomic,strong)KMSpinner *spinnerView;
@end

@implementation KMViewController
@synthesize spinnerView;
@synthesize buttonTform;
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
    i  = 1;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 60, 100, 30)];
    lbl.font = [UIFont systemFontOfSize:12.0f];

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(90, 60, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"down_arrow.png"] forState:UIControlStateNormal];
    [btn addTarget:self
                 action:@selector(transformView:)
       forControlEvents:UIControlEventTouchUpInside];
    textFielddate = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 100, 30)];
    textFielddate.borderStyle = UITextBorderStyleRoundedRect;
    textFielddate.delegate = self; // ADD THIS LINE
    textFielddate.font = [UIFont systemFontOfSize:12.0f];

    textFieldnoWeeks = [[UITextField alloc]initWithFrame:CGRectMake(140, 60, 40, 30)];
    textFieldnoWeeks.borderStyle = UITextBorderStyleRoundedRect;
    textFieldnoWeeks.returnKeyType = UIReturnKeyDone;
    textFieldnoWeeks.delegate = self; // ADD THIS LINE
    textFieldnoWeeks.font = [UIFont systemFontOfSize:12.0f];
    [textFieldnoWeeks setKeyboardType:UIKeyboardTypeNumberPad];
    
    mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    [scrollView addSubview:mainView];
    spinnerView = [[KMSpinner alloc]initWithFrame:CGRectMake(62,153,195,195)];
    spinnerView.backgroundColor = [UIColor clearColor];
    spinnerView.layer.cornerRadius = 97.5;

    
    circleView = [[UIView alloc] initWithFrame:CGRectMake(40,130,240,240)];
    circleView.alpha = 0.5;
    circleView.layer.cornerRadius = 125;
    circleView.backgroundColor = [UIColor orangeColor];
    
    circleView1 = [[UIView alloc] initWithFrame:CGRectMake(10,100,300,300)];
    circleView1.alpha = 1.0;
    circleView1.layer.cornerRadius = 150;
    circleView1.backgroundColor = [UIColor clearColor];
    
    UIView *circleView3 = [[UIView alloc] initWithFrame:CGRectMake(110,200,100,100)];
    circleView3.alpha = 1.0;
    circleView3.layer.cornerRadius = 50;
    circleView3.backgroundColor = [UIColor greenColor];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"celender_outer_481.png"]];
    imgView.frame = circleView1.bounds;
    [circleView1 addSubview:imgView];
    
    
    //celender_inner.png
    UIImageView *imgView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"calander_mob1.png"]];
   // calander.png
    imgView2.frame = spinnerView.bounds;
    imgView2.backgroundColor = [UIColor clearColor];
    [spinnerView addSubview:imgView2];

    
    
    
    [mainView addSubview:circleView1];
    [mainView addSubview:spinnerView];
    m_label = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 90, 30)];
    m_label.backgroundColor = [UIColor whiteColor];

    scrollView.delegate = self;
    //    self.scrollView.minimumZoomScale = 1.0;
    scrollView.maximumZoomScale = 100.0;
    //[scrollView addSubview:buttonTform];
    [scrollView addSubview:textFielddate];
    [scrollView addSubview:textFieldnoWeeks];
    [scrollView addSubview:btn];
    [scrollView addSubview:lbl];
    
}

- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    NSLog(@"Pinch scale: %f", recognizer.scale);
    if (recognizer.scale >= 0)
    {

    }
    else
    {
        // do negative stuff
    }
    CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
    // you can implement any int/float value in context of what scale you want to zoom in or out
    self.view.transform = transform;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(scrollView.bounds),
                                      CGRectGetMidY(scrollView.bounds));
    //[self view:circleView1 setCenter:centerPoint];
}
- (void)view:(UIView*)view setCenter:(CGPoint)centerPoint
{
    CGRect vf = view.frame;
    CGPoint co = scrollView.contentOffset;
    
    CGFloat x = centerPoint.x - vf.size.width / 2.0;
    CGFloat y = centerPoint.y - vf.size.height / 2.0;
    
    if(x < 0)
    {
        co.x = -x;
        vf.origin.x = 0.0;
    }
    else
    {
        vf.origin.x = x;
    }
    if(y < 0)
    {
        co.y = -y;
        vf.origin.y = 0.0;
    }
    else
    {
        vf.origin.y = y;
    }
    
    view.frame = vf;
    scrollView.contentOffset = co;
}

#pragma ScrollView delegate Methods
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return  mainView;
}

- (void)scrollViewDidZoom:(UIScrollView *)sv
{
    UIView* zoomView = [sv.delegate viewForZoomingInScrollView:sv];
    CGRect zvf = zoomView.frame;
    if(zvf.size.width < sv.bounds.size.width)
    {
        zvf.origin.x = (sv.bounds.size.width - zvf.size.width) / 2.0;
    }
    else
    {
        zvf.origin.x = 0.0;
    }
    if(zvf.size.height < sv.bounds.size.height)
    {
        zvf.origin.y = (sv.bounds.size.height - zvf.size.height) / 2.0;
    }
    else
    {
        zvf.origin.y = 0.0;
    }
    zoomView.frame = zvf;
}



- (IBAction)transformView:(id)sender {
  i = i+1;
//        CGAffineTransform transform = self.view.transform;
//        [spinnerView setTransform:CGAffineTransformRotate(transform, (M_PI / i))];
    pickerView = [[UIDatePicker alloc]init];
    [pickerView addTarget:self action:@selector(calculateWeeks:) forControlEvents:UIControlEventValueChanged];
    pickerView.datePickerMode = UIDatePickerModeDate;
    @try {
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd MM yyyy"];
        NSDate * dateToSet = [formatter dateFromString:textFielddate.text];
        pickerView.date = dateToSet;
    }
    
    @catch (NSException *exception) {
        //if the date is in wrong format, set date to today
        pickerView.date = [NSDate date];
    }
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    mypickerToolbar.backgroundColor = [UIColor colorWithRed:13/255.0 green:33/255.0 blue:39/255.0 alpha:1.0];
    [mypickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [mypickerToolbar setItems:barItems animated:YES];
    sheet = [[UIActionSheet alloc] initWithTitle:nil
                                    delegate:self
                                    cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                    otherButtonTitles:nil];
    [sheet addSubview:pickerView];
    [sheet showInView:self.view.superview];
    [sheet addSubview:mypickerToolbar];
    [sheet showInView:self.view.superview];
    [sheet setBounds:CGRectMake(0, 0, 320, 400)];
}
-(void)calculateWeeks:(id)sender{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterMediumStyle;
    [formatter setDateFormat:@"dd MMM yyyy"];
    textFielddate.text = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:pickerView.date]];
    
    //NSLog(@"%@ Date is",[NSString stringWithFormat:@"%@",[formatter setDateFormat:@"dd"]]);

    [formatter setDateFormat:@"MMM"];
    NSDate *aDate = [formatter dateFromString:[formatter stringFromDate:pickerView.date]];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:aDate];
    NSLog(@"Month: %i", [components month]);
    month = [components month];
    [formatter setDateFormat:@"dd"];
    aDate = [formatter dateFromString:[formatter stringFromDate:pickerView.date]];
    NSLog(@"Date: %@", [formatter stringFromDate:pickerView.date]);
    date = [[formatter stringFromDate:pickerView.date] intValue];
    [formatter setDateFormat:@"yyyy"];
    year = [[formatter stringFromDate:pickerView.date] intValue];
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor clearColor];
    [textField resignFirstResponder];

    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
   // NSLog(@"textFieldDidEndEditing");
    if ([textField.text length] > 3) {
        textField.text = @"";
        [textField resignFirstResponder];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"alert" message:@"Your entry cannot exceed 999" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }else if ([textField.text  isEqual: @""]){
        [textField resignFirstResponder];
    }else{
        NSDictionary *dict =  [self calculateWeeks:[textField.text intValue] currentDate:date currentMonth:month currentYear:year];
        NSLog(@"DATE IS:%@",dict);
        int monthNumber = [[dict objectForKey:@"month"] intValue];
        NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
        //[df setDateFormat:@"MMM"];
        NSString *monthName = [[df monthSymbols] objectAtIndex:(monthNumber-1)];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"MM dd YYYY"];
        NSString *DateString = [NSString stringWithFormat:@"%@ %@ %@",monthName,[dict objectForKey:@"date"],[dict objectForKey:@"year"]];
        
        [formatter setDateFormat:@"MMMM dd YYYY"];
        defaultDate = [formatter dateFromString:DateString];
        NSLog(@"NSString before format: %@", DateString);
        defaultDate = [formatter dateFromString:DateString];
        
        monthName = [monthName substringToIndex:3];
        NSString *str = [NSString stringWithFormat:@"%@ %@ %@",[dict objectForKey:@"date"],monthName,[dict objectForKey:@"year"]];
        lbl.text = str;
        lbl.textColor = [UIColor blueColor];
        [textField resignFirstResponder];
    }
   

    

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor whiteColor];
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                          // [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    textField.inputAccessoryView = numberToolbar;
    return YES;
}
-(void)cancelNumberPad{
    [textFieldnoWeeks resignFirstResponder];
    textFieldnoWeeks.text = @"";
}

-(void)doneWithNumberPad{
   // NSString *numberFromTheKeyboard = textFieldnoWeeks.text;
    [textFieldnoWeeks resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
   // NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}


-(NSMutableDictionary *)calculateWeeks:(int)inWeekno currentDate:(int)inDate currentMonth:(int)inMonth currentYear:(int)currentYear{
    // 31 days 1,3,5,7,8,10,12
    // 30 days 4,6,9,11
 
    int currentDate = inDate;
    int currentMonth = inMonth;
    int currentyear = currentYear;
    for (int j = 0; j < inWeekno; j++) {
        currentDate = currentDate+7;
        if ((currentMonth == 1||currentMonth == 3||currentMonth == 5||currentMonth == 7||currentMonth == 8||currentMonth == 10||currentMonth == 12)&&currentDate >31) {
            NSLog(@"CD:%d",currentDate);
            if (currentMonth == 12) {
                currentMonth = 1;
                currentyear = currentyear+1;
                
            }else{
                currentMonth = currentMonth+1;
            }
            
            currentDate = currentDate - 31;

            NSLog(@"CD:%d",currentDate);
            
            
        }else if ((currentMonth == 4||currentMonth == 6||currentMonth == 9||currentMonth == 11)&&currentDate >30){
            currentMonth = currentMonth+1;
            currentDate = currentDate - 30;
            
        }else if ((currentMonth == 2)&&currentDate >29){
            currentMonth = currentMonth+1;
            currentDate = currentDate - 29;
        }
        

        NSLog(@"****CURRENT DATE:%d,Month:%d",currentDate,currentMonth);
        
        
    }
    NSLog(@"CURRENT DATE:%d,Month:%d",currentDate,currentMonth);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[NSNumber numberWithInt:currentDate] forKey:@"date"];
    [dict setObject:[NSNumber numberWithInt:currentMonth] forKey:@"month"];
    [dict setObject:[NSNumber numberWithInt:currentyear] forKey:@"year"];
    return dict;
    
    
}

-(void)pickerDoneClicked
{
    [sheet dismissWithClickedButtonIndex:0 animated:YES];

}








@end
