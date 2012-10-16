//
//  ViewController.m
//  GuessNum
//
//  Created by youzhuang on 12-10-13.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _text.delegate = self;
    
    _numGame = [[NumberManager alloc] initWithNumbCount:4];
    [_numGame randNumbers];
    
    if ([_numGame isRightFormat:_text.text]) {
        [_numGame calulate:_numGame.curNumbers];
    }
    
    _targetNum.text = [_numGame stringOfArray:_numGame.target];
    if ([_numGame End]) {
        _resultDescription.text = @"正确";
    }else{
        _resultDescription.text = @"wrong";
    }
    _lastNumber.text = _text.text;
    _caculateResult.text = [NSString stringWithFormat:@"%dA%dB",_numGame.numA,_numGame.numB];

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if ([_numGame isRightFormat:_text.text]) {
        [_numGame calulate:_numGame.curNumbers];
    }
    
    _targetNum.text = [_numGame stringOfArray:_numGame.target];
    if ([_numGame End]) {
        _resultDescription.text = @"正确";
    }else{
        _resultDescription.text = @"wrong";
    }
    _lastNumber.text = _text.text;
    _caculateResult.text = [NSString stringWithFormat:@"%dA%dB",_numGame.numA,_numGame.numB];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
