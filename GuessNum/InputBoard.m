//
//  InputBoard.m
//  GuessNum
//
//  Created by youzhuang on 12-10-14.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "InputBoard.h"

#define BTN_OFFSET 10
#define BTN_W 41
#define BTN_H 60
#define ROW_NUM 6

@implementation InputBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withChapter:(NSInteger)chap
{
    self = [self initWithFrame:frame];
    if (self) {
        _chapter = chap;
        for (int i = 0 ; i < 11; i++) {
            if (i < 10) {
                UIButton *piece = [UIButton buttonWithType:UIButtonTypeCustom];
                piece.frame = CGRectMake(BTN_OFFSET + i % ROW_NUM * (BTN_OFFSET+BTN_W), BTN_OFFSET + i/ROW_NUM * (BTN_H+BTN_OFFSET), BTN_W, BTN_H);
                [piece setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_%d.jpg",chap,i]] forState:UIControlStateNormal];
                [piece setImage:[UIImage imageNamed:@"select"]  forState:UIControlStateHighlighted];
                [piece setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
                [piece addTarget:self action:@selector(selectPiece:) forControlEvents:UIControlEventTouchUpInside];
                piece.tag = i;
                [self addSubview:piece];
            }else{
                UIButton *commit = [UIButton buttonWithType:UIButtonTypeCustom];
                commit.frame = CGRectMake(BTN_OFFSET + i % ROW_NUM * (BTN_OFFSET+BTN_W) , BTN_OFFSET + BTN_H + BTN_OFFSET, BTN_W * 2 + BTN_OFFSET, BTN_H);
                [commit setBackgroundImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
                [commit addTarget:self action:@selector(commitResult:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:commit];
            }
        }
    }
    return self;
}

-(void)selectPiece:(id)sender
{
    _selectedNumber = [sender tag];
    for (UIButton *btn in [self subviews]) {
        btn.selected = btn.tag == _selectedNumber;
    }
    [_delegate InputBoardDidSelect:self];
}

-(void)commitResult:(id)sender
{
    [_delegate InputBoardDidCommit:self];
    [self popOutWindow];
    
}

-(void)pushInwindow
{
    [UIView animateWithDuration:1.0f animations:^(void){
        CGRect appFrame = [UIScreen mainScreen].applicationFrame;
        self.frame = CGRectMake(0, appFrame.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finish){
        
    }];
}

-(void)popOutWindow
{
    [UIView animateWithDuration:1.0f animations:^(void){
        CGRect appFrame = [UIScreen mainScreen].applicationFrame;
        self.frame = CGRectMake(0, appFrame.size.height, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finish){
        
    }];
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
