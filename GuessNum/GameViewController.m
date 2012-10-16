//
//  GameViewController.m
//  GuessNum
//
//  Created by youzhuang on 12-10-15.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import "GameViewController.h"

#import "InputBoard.h"
#import "NumberPiece.h"

#define FIELD_H 150

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
    [_board release];
    [_field release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _resultIndex = 0;
    
    _NumbersneedToFix = [[NSMutableArray alloc] initWithCapacity:4];
    for (int i = 0; i < 4; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:-1 inSection:i];
        [_NumbersneedToFix addObject:path];
    }
    
    _numManager = [[NumberManager alloc] initWithNumbCount:4];
    [_numManager randNumbers];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
     CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    
    _field = [[PieceField alloc] initWithFrame:CGRectMake(0, 0, appFrame.size.width, FIELD_H) withFieldCount:4 withChapter:1];
    [self.view addSubview:_field];
    
   
    _board = [[InputBoard alloc] initWithFrame:CGRectMake(0, appFrame.size.height, appFrame.size.width, 150) withChapter:1];
    _board.delegate = self;
    [self.view addSubview:_board];
    
    _field.board = _board;
}

-(void)InputBoardDidSelect:(InputBoard *)board
{
    _field.selectNumber = board.selectedNumber;
    for (NSIndexPath *path in _NumbersneedToFix) {
        if (path.section == _field.selectIndex) {
            NSIndexPath *newPath = [NSIndexPath indexPathForRow:_field.selectNumber inSection:_field.selectIndex];
            [_NumbersneedToFix replaceObjectAtIndex:path.section withObject:newPath];
            break;
        }
    }
}

-(void)InputBoardDidCommit:(InputBoard *)board
{
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:4];
    for (NSIndexPath *path in _NumbersneedToFix) {
        if (path.row == -1) {
            UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"提示" message:@"需要选择四张卡片！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [v show];
            [v release];
            return;
        }
        [temp addObject:[NSNumber numberWithInteger:path.row]];
    }
    NSLog(@"calulating numbers %@",temp);
    //计算四张卡片是否正确
    [_numManager calulate:temp];
    
    [self drawResult];
    [_field resetImages];
}

-(void)drawResult
{
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, FIELD_H + (40 + 5) * _resultIndex, 60, 40)];
    label1.text = [NSString stringWithFormat:@"第%d次",_resultIndex+1];
    [self.view addSubview:label1];
    [label1 release];
    //piece 25*30
    for (int i = 0; i < 4; i++) {
        NSIndexPath *path = [_NumbersneedToFix objectAtIndex:i];
        NumberPiece *piece = [[NumberPiece alloc] initWithFrame:CGRectMake( 60 + 5 + (5+28)*i, 5 + FIELD_H + _resultIndex*(40+5), 28, 40) withChapter:1 withNumber:path.row];
        [self.view addSubview:piece];
        [piece release];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, FIELD_H + (40+5) * _resultIndex, 50, 40)];
    label.text = [NSString stringWithFormat:@"%dO%dP",_numManager.numA,_numManager.numB];
    [self.view addSubview:label];
    [label release];
    if ([_numManager End]) {
        UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"提示" message:@"恭喜你，找到答案了！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [v show];
        [v release];
        return;
    }
    _resultIndex += 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
