//
//  InputBoard.h
//  GuessNum
//
//  Created by youzhuang on 12-10-14.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *just used of selecting numberPiece!
 *it has ten picebutton and a OK button
 *
 **/
@class InputBoard;

@protocol InputBoardDelegate <NSObject>

-(void)InputBoardDidSelect:(InputBoard*)board;
-(void)InputBoardDidCommit:(InputBoard *)board;

@end

@interface InputBoard : UIView

@property (nonatomic,assign) NSInteger selectedNumber;
@property (nonatomic,assign) NSInteger chapter;
@property (nonatomic,assign) id<InputBoardDelegate> delegate;

-(id)initWithFrame:(CGRect)frame withChapter:(NSInteger)chap;

-(void)selectPiece:(id)sender;

-(void)commitResult:(id)sender;

-(void)pushInwindow;
-(void)popOutWindow;

@end
