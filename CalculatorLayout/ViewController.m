//
//  ViewController.m
//  CalculatorLayout
//
//  Created by Steve Graff on 4/18/16.
//  Copyright © 2016 Steve Graff. All rights reserved.
//
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController () {
    CalculatorBrain *brain;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

-(IBAction)operandTapped:(UIButton *)sender; // operand is number or decimal point key
-(IBAction)additionTapped:(UIButton *)sender;
-(IBAction)subtractionTapped    :(UIButton *)sender;
-(IBAction)multiplicationTapped:(UIButton *)sender;
-(IBAction)divisionTapped:(UIButton *)sender;
-(IBAction)equalTapped:(UIButton *)sender;
-(IBAction)allClearTapped:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.displayLabel.text = @"0";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)operandTapped:(UIButton *)sender {
    if ([self.displayLabel.text isEqualToString:@"0"] || brain.userIsTypingNumber) {
        self.displayLabel.text = sender.titleLabel.text;
        brain.userIsTypingNumber = NO;
    } else if ([sender.titleLabel.text isEqualToString:@"."] && [self.displayLabel.text containsString:@"."]) {
            // Do nothing
    } else {
        self.displayLabel.text = sender.titleLabel.text;
    }
}


-(IBAction)additionTapped:(UIButton *)sender {
    if (!brain) {
        brain = [[CalculatorBrain alloc]init];
    }
    
    brain.operatorType = OperatorTypeAddition;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
    // self.userIsTypingNumber = YES;
}
    
-(IBAction)subtractionTapped:(UIButton *)sender {
    brain.operatorType = OperatorTypeSubtraction;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
}

-(IBAction)multiplicationTapped:(UIButton *)sender {
    brain.operatorType = OperatorTypeMultiplication;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
}

-(IBAction)divisionTapped:(UIButton *)sender {
    brain.operatorType = OperatorTypeDivision;
    brain.operand1String = [self.displayLabel.text mutableCopy];
    brain.operand1 = [brain.operand1String floatValue];
}

-(IBAction)equalTapped:(UIButton *)sender {
    brain.operand2String = [self.displayLabel.text mutableCopy];
    brain.operand2 = [brain.operand2String floatValue];
    
    // run operation
    // set the label to be the result
    self.displayLabel.text = [brain executeOperationOnOperands];
    
    // get a new brain
    brain = [[CalculatorBrain alloc]init];
}

-(IBAction)allClearTapped:(UIButton *)sender{
    self.displayLabel.text = @"0";
    // Reset the brain
}


@end
