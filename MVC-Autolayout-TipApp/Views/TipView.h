//
//  TipView.h
//  MVC-Autolayout-TipApp
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipView : UIView

// image view
@property (nonatomic) UIImageView *imageView;

// percent value labels
@property (nonatomic) UILabel *tenPercentValue;
@property (nonatomic) UILabel *fifteenPercentValue;
@property (nonatomic) UILabel *twentyPercentValue;

// stack view will hold the value labels
@property (nonatomic) UIStackView *stackView;

// labels
@property (nonatomic) UILabel *tenPercentLabel;
@property (nonatomic) UILabel *fifteenPercentLabel;
@property (nonatomic) UILabel *twentyPercentLabel;

// your bill label
@property (nonatomic) UILabel *billLabel;

// text field
@property (nonatomic) UITextField *billTextField;

// calculate button
@property (nonatomic) UIButton *calculateTipButton;

- (void)updatesTipValues: (double)tenPercent
          fifteenPercent: (double)fifteenPercent
           twentyPercent: (double)twentyPercent;

@end
