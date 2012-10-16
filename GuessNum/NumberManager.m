//
//  NumberManager.m
//  GuessNum
//
//  Created by youzhuang on 12-10-13.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "NumberManager.h"

@implementation NumberManager
@synthesize curNumbers = _curNumbers;
@synthesize target = _target;
@synthesize numA = _numA;
@synthesize numB = _numB;

-(id)initWithNumbCount:(NSInteger)count
{
    if (self=[super init]) {
        _numCount = count;
        _curNumbers = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray*)randNumbers
{
    self.target = nil;
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:_numCount];
    srand(time(NULL));
    for (int i = 0; i < _numCount; i++) {
        
        NSInteger num;
        while (1) {
           num = rand()%10;
            NSNumber *tempNum = [NSNumber numberWithInteger:num];
           if([temp containsObject:tempNum]) {
               continue;
           }else
           {
               [temp addObject:tempNum];
               break;
           }
        }
    }
    NSLog(@"rand number :%@",temp);
    self.target = temp;
    return self.target;
}

-(void)calulate:(NSArray *)numbers
{
    _numA = _numB = 0;
    assert([numbers count] == 4);
    for (int i = 0; i < _numCount; i++) {
        NSInteger targetNumber = [[_target objectAtIndex:i] integerValue];
        for (int j = 0; j < _numCount; j++) {
            NSInteger tempNumber = [[numbers objectAtIndex:j] integerValue];
            if (targetNumber == tempNumber) {
                if (i == j) {
                    _numA++;
                    break;
                }else{
                    _numB++;
                    break;
                }
                
            }
        }
    }
}

-(BOOL)isRightFormat:(NSString *)input
{
    if ([input length] != _numCount) {
        return NO;
    }
    [_curNumbers removeAllObjects];
    for (int i = 0; i < [input length]; i++) {
        char temp = [input characterAtIndex:i];
        if (temp > '9' || temp < '0') {
            return NO;
        }
        [_curNumbers addObject:[NSNumber numberWithChar:temp-48]];
    }
    return YES;
}

-(BOOL)End
{
    return _numA==4;
}

-(NSString*)stringOfArray:(NSArray *)array
{
    NSMutableString *temp = [NSMutableString string];
    for (int i = 0; i < [array count]; i++) {
        NSNumber *num = [array objectAtIndex:i];
        [temp appendFormat:@"%@",num];
    }
    return temp;
}

@end
