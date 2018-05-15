//
//  Tip.m
//  MVC-Autolayout-TipApp
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tip.h"

@implementation Tip
- (instancetype)initWithBill:(double)bill tipPercent:(double)tipPercent {
    self = [super init];
    if (self) {
        _bill = bill;
        _tipPercent = tipPercent;
        _totalBill = bill * (tipPercent / 100.0);
    }
    return self;
}
@end
