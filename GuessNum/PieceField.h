//
//  PieceField.h
//  GuessNum
//
//  Created by youzhuang on 12-10-15.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputBoard.h"

@interface PieceField : UIView

@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,assign) NSInteger selectNumber;
@property (nonatomic,assign) NSInteger chapterIndex;
@property (nonatomic,assign) NSInteger fieldCount;
@property (nonatomic,assign) NSInteger selectedFieldCount;

@property (nonatomic,assign) InputBoard *board;

-(id)initWithFrame:(CGRect)frame withFieldCount:(NSInteger)fieldCount withChapter:(NSInteger)chap;
-(void)resetImages;

@end
