//
//  Tip.h
//  MVC-Autolayout-TipApp
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

@interface Tip: NSObject

typedef NS_ENUM(NSInteger, TipPercent) {
    tenPercent = 10,
    fifteenPercent = 15,
    twentyPercent = 20
};

// we use (assign) attribute for primitive types: int, char, float.....
@property (assign) double bill;
@property (nonatomic) TipPercent tipPercent;
@property (nonatomic, readonly) double totalBill; 

- (instancetype)initWithBill: (double)bill tipPercent: (double)tipPercent;

@end
