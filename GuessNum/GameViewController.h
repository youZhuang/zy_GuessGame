//
//  GameViewController.h
//  GuessNum
//
//  Created by youzhuang on 12-10-15.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InputBoard.h"
#import "PieceField.h"

#import "NumberManager.h"

@interface GameViewController : UIViewController<InputBoardDelegate>

@property (nonatomic,retain) InputBoard *board;
@property (nonatomic,retain) PieceField *field;

@property (nonatomic,retain) NSMutableArray *NumbersneedToFix;

@property (nonatomic,retain) NumberManager *numManager;

@property (nonatomic,assign) NSInteger resultIndex;

@end
