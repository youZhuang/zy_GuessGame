//
//  NumberPiece.h
//  GuessNum
//
//  Created by youzhuang on 12-10-14.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPiece : UIView

@property (nonatomic,assign) NSInteger number;
@property (nonatomic,retain) UIImage *image;
@property (nonatomic,assign) NSInteger chapter;

-(id)initWithFrame:(CGRect)frame withChapter:(NSInteger)chap withNumber:(NSInteger)num;

@end
