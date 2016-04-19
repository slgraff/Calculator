//
//  CalculatorBrain.m
//  CalculatorLayout
//
//  Created by Steve Graff on 4/19/16.
//  Copyright © 2016 Steve Graff. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

typedef enum
{
    OperatorTypeNone,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision
} OperatorType;

@interface CalculatorBrain: NSObject

@property (strong, nonatomic) NSMutableString *operandString;
@property (strong, nonatomic) NSMutableString *operand2String;

@property (assign) float operand1;
@property (assign) float operand2;
@property (assign) OperatorType operatorType;
@property (assign) BOOL userIsTypingNumber;


@end
