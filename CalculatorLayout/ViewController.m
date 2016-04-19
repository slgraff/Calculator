//
//  ViewController.m
//  CalculatorLayout
//
//  Created by Steve Graff on 4/18/16.
//  Copyright © 2016 Steve Graff. All rights reserved.
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
    if ([self.displayLabel.text isEqualToString:@"0"]) {
        self.displayLabel.text = sender.titleLabel.text;
    } else {
        
        // If operand is . and displayContains . already
        if ([sender.titleLabel.text isEqualToString:@"."] && [self.displayLabel.text containsString:@"."]) {
            // Do nothing
        } else {
            self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.titleLabel.text];
        }
    }
}

-(IBAction)additionTapped:(UIButton *)sender {
    
}
    
-(IBAction)subtractionTapped:(UIButton *)sender {
    
}

-(IBAction)multiplicationTapped:(UIButton *)sender {
    
}

-(IBAction)divisionTapped:(UIButton *)sender {
    
}

-(IBAction)equalTapped:(UIButton *)sender {
    
}

-(IBAction)allClearTapped:(UIButton *)sender{
    self.displayLabel.text = @"0";
    // Reset the brain
}


@end
