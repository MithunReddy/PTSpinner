//
//  KMViewController.h
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface KMViewController : UIViewController<UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextFieldDelegate,UIActionSheetDelegate>
- (IBAction)transformView:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonTform;

@end
