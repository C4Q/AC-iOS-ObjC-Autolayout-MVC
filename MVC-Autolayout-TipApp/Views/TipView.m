//
//  TipView.m
//  MVC-Autolayout-TipApp
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "TipView.h"

#define PADDING 20

@implementation TipView

// -(instancetype) is more type safe over -(id)
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // do setup code for views
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
}

- (void)setupViews {
    self.backgroundColor = [UIColor orangeColor];
    [self setupImageView];
    [self setupStackView];
    [self setupBillLabel];
    [self setupBillTextField];
    [self setupCalculateButton];
}

- (void)setupImageView {
    if(!_imageView)
        _imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"tip-icon"];
    self.imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    
    // setup constraints using batch contraints
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO; 
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:PADDING],
                                              [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              [self.imageView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.25],
                                              [self.imageView.widthAnchor constraintEqualToAnchor:self.imageView.heightAnchor]
    ]];
}

- (void) setupValueLabels {
    _tenPercentValue = [[UILabel alloc] init];
    self.tenPercentValue.text = @"$0.00";
    self.tenPercentValue.textAlignment = NSTextAlignmentCenter;
    self.tenPercentValue.backgroundColor = [UIColor redColor];
    
    _fifteenPercentValue = [[UILabel alloc] init];
    self.fifteenPercentValue.text = @"$0.00";
    self.fifteenPercentValue.textAlignment = NSTextAlignmentCenter;
    self.fifteenPercentValue.backgroundColor = [UIColor greenColor];

    _twentyPercentValue = [[UILabel alloc] init];
    self.twentyPercentValue.text = @"$0.00";
    self.twentyPercentValue.textAlignment = NSTextAlignmentCenter;
    self.twentyPercentValue.backgroundColor = [UIColor yellowColor];
}

- (void) setupStackView {
    if(!_stackView) {
        _stackView = [[UIStackView alloc] init];
    }
    [self setupValueLabels];
    
    [self.stackView addArrangedSubview:self.tenPercentValue];
    [self.stackView addArrangedSubview:self.fifteenPercentValue];
    [self.stackView addArrangedSubview:self.twentyPercentValue];

    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.spacing = PADDING;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    
    [self addSubview:self.stackView];
    
    // setup constraints for the stack view
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:PADDING],
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:PADDING],
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-PADDING],
        [self.stackView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.10]
    ]];
}

- (void)setupBillLabel {
    if(!_billLabel)
        _billLabel = [[UILabel alloc] init];
    self.billLabel.text = @"Your Bill";
    [self addSubview:self.billLabel];
    
    // setup constraints
    self.billLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.billLabel.topAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant:PADDING],
        [self.billLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:PADDING]
    ]];
}

- (void)setupBillTextField {
    if(!_billTextField)
        _billTextField = [[UITextField alloc] init];
    self.billTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.billTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.billTextField.backgroundColor = [UIColor whiteColor];
    self.billTextField.text = @"$0.00";
    self.billTextField.textAlignment = NSTextAlignmentCenter;
    self.billTextField.font = [UIFont systemFontOfSize:40 weight:UIFontWeightBold];
    
    // add an inputAccessoryView
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 49)];
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    [keyboardToolbar setItems:@[dismissButton]];
    
    self.billTextField.inputAccessoryView = keyboardToolbar;
    
    [self addSubview:self.billTextField];
    
    // setup constraints
    self.billTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.billTextField.topAnchor constraintEqualToAnchor:self.billLabel.bottomAnchor constant:PADDING],
        [self.billTextField.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:PADDING],
        [self.billTextField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-PADDING],
        [self.billTextField.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.20]
                                              ]];
}

- (void)setupCalculateButton {
    if(!_calculateTipButton)
        _calculateTipButton = [[UIButton alloc] init];
    [self.calculateTipButton setTitle:@"Calculate Tip" forState:UIControlStateNormal];
    [self.calculateTipButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.calculateTipButton.titleLabel.font = [UIFont systemFontOfSize:25 weight:UIFontWeightBold];
    self.calculateTipButton.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.calculateTipButton];
    
    // setup constraints
    self.calculateTipButton.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.calculateTipButton.topAnchor constraintEqualToAnchor:self.billTextField.bottomAnchor constant: PADDING],
        [self.calculateTipButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:PADDING],
        [self.calculateTipButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-PADDING],
        [self.calculateTipButton.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.20]
    ]];
}

- (void)dismiss {
    // keyboard is first responder here so we want to dismiss it
    [self.billTextField resignFirstResponder];
}

- (void)updatesTipValues: (double)tenPercent
          fifteenPercent: (double)fifteenPercent
           twentyPercent: (double)twentyPercent {
    self.tenPercentValue.text = [NSString stringWithFormat:@"$%1.2f", tenPercent];
    self.fifteenPercentValue.text = [NSString stringWithFormat:@"$%1.2f", fifteenPercent];
    self.twentyPercentValue.text = [NSString stringWithFormat:@"$%1.2f", twentyPercent];
    
    NSString *billValue = [self.billTextField.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString *formattedStringBillValue = [NSString stringWithFormat:@"$%@", billValue];
    self.billTextField.text = formattedStringBillValue;
    
    [self dismiss];
}

@end
