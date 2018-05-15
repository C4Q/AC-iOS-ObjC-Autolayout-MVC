//
//  TipViewController.m
//  MVC-Autolayout-TipApp
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "TipViewController.h"
#import "TipView.h"
#import "Tip.h"

@interface TipViewController ()
// private properties or methods
@property (nonatomic) TipView *tipView;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    // lazy initialization
    if(!_tipView)
        _tipView = [[TipView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    // we can send message to nil without crashes
    [self.view addSubview:self.tipView];
    
    [self registerForKeyboardNotifications];
    
    [self.tipView.calculateTipButton addTarget:self action:@selector(calculateTip) forControlEvents:UIControlEventTouchUpInside];
}

-(void)calculateTip {
    double bill = [self.tipView.billTextField.text doubleValue];
    
    Tip *tenPercentTip = [[Tip alloc] initWithBill:bill tipPercent:tenPercent];
    Tip *fifteenPercentTip = [[Tip alloc] initWithBill:bill tipPercent:fifteenPercent];
    Tip *twentyPercentTip = [[Tip alloc] initWithBill:bill tipPercent:twentyPercent];
    
    [self.tipView updatesTipValues:tenPercentTip.totalBill
                    fifteenPercent:fifteenPercentTip.totalBill
                     twentyPercent:twentyPercentTip.totalBill];
}

#pragma mark Keyboard Handling
- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow: (NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGSize size = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    self.tipView.transform = CGAffineTransformMakeTranslation(0, -size.height);
}

- (void)keyboardWillHide: (NSNotification *)notification {
    self.tipView.transform = CGAffineTransformIdentity;
}



@end
