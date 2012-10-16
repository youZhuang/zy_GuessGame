//
//  NumberPiece.m
//  GuessNum
//
//  Created by youzhuang on 12-10-14.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "NumberPiece.h"

@implementation NumberPiece
@synthesize number = _number;
@synthesize image = _image;
@synthesize chapter = _chapter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withChapter:(NSInteger)chap withNumber:(NSInteger)num
{
    self = [self initWithFrame:frame];
    if (self) {
        _chapter = chap;
        _number  = num;
        _image = [UIImage imageNamed:[NSString stringWithFormat:@"%d_%d.jpg",_chapter,_number]];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        imageview.image = _image;
        [self addSubview:imageview];
        [imageview release];
        
    }
    return self;
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
