//
//  PieceField.m
//  GuessNum
//
//  Created by youzhuang on 12-10-15.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "PieceField.h"

#define FIELD_OFFSET 20
#define FIELD_W 55
#define FIELD_H 60

@implementation PieceField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withFieldCount:(NSInteger)fieldCount withChapter:(NSInteger)chap
{
    self = [self initWithFrame:frame];
    if (self) {
        _fieldCount = fieldCount;
        _selectIndex = -1;
        _selectNumber = -1;
        _chapterIndex = chap;
        
        _selectedFieldCount = 0;
        
        [self addFields];
    }
    return self;
}

-(void)addFields
{
    for (int i = 0; i < _fieldCount; i++) {
        UIButton *field = [UIButton buttonWithType:UIButtonTypeCustom];
        field.frame = CGRectMake(FIELD_OFFSET + (FIELD_W + FIELD_OFFSET) * i, FIELD_OFFSET , FIELD_W, FIELD_H);
        [field setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [field addTarget:self action:@selector(fieldHandle:) forControlEvents:UIControlEventTouchDown];
        field.tag = i;
        [self addSubview:field];
    }
}

-(void)fieldHandle:(id)sender
{
    _selectIndex = [sender tag];
    if (_board != nil) {
        [_board pushInwindow];
    }
}

-(void)setSelectNumber:(NSInteger)selectNumber
{
    if (selectNumber < 10 && selectNumber > -1) {
        _selectNumber = selectNumber;
        for (UIButton *btn in [self subviews]) {
            if (btn.tag==_selectIndex) {
                [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_%d.jpg",_chapterIndex,_selectNumber]] forState:UIControlStateNormal];
            }
        }
    }
}

-(void)resetImages
{
    for (UIButton *btn in [self subviews]) {
        [btn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
