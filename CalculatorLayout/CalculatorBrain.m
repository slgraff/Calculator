//
//  CalculatorBrain.m
//  CalculatorLayout
//
//  Created by Steve Graff on 4/19/16.
//  Copyright © 2016 Steve Graff. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _operand1String = [[NSMutableString alloc]init];
        _operand2String = [[NSMutableString alloc]init];
        _operand1 = 0.0f;
        _operand2 = 0.0f;
        _operatorType = OperatorTypeNone;
        _userIsTypingNumber = NO;
    }
    
    return self;
}

-(NSString*)executeOperationOnOperands{
    if(![self.operand1String isEqualToString:@""] && ![self.operand2String isEqualToString:@""] && self.operatorType != OperatorTypeNone) {
        float result;
        switch(_operatorType) {
            case OperatorTypeAddition:
                result = self.operand1 + self.operand2;
                break;
            case OperatorTypeSubtraction:
                result = self.operand1 - self.operand2;
                break;
            case OperatorTypeMultiplication:
                result = self.operand1 * self.operand2;
                break;
            case OperatorTypeDivision:
                result = self.operand1 / self.operand2;
                break;
                
            default:
                NSLog(@"Someone has hacked our calculator");
                return @"HACKED!";
                break;
        }
        return [NSString stringWithFormat:@"%f", result];
    }
    return @"invalid";
}

@end
