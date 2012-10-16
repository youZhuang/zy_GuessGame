//
//  NumberManager.h
//  GuessNum
//
//  Created by youzhuang on 12-10-13.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberManager : NSObject

@property (nonatomic,retain) NSMutableArray *curNumbers;
@property (nonatomic,retain) NSArray *target;

@property (nonatomic,assign) NSInteger numCount;

@property (nonatomic,assign) NSInteger numA;//位置正确的个数
@property (nonatomic,assign) NSInteger numB;//数字正确 位置不正确的个数

-(id)initWithNumbCount:(NSInteger)count;

-(void)calulate:(NSArray*)numbers;

-(NSArray*)randNumbers;

-(BOOL)isRightFormat:(NSString*)input;
-(BOOL)End;

-(NSString*)stringOfArray:(NSArray*)array;

@end
