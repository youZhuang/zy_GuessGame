//
//  ViewController.h
//  GuessNum
//
//  Created by youzhuang on 12-10-13.
//  Copyright (c) 2012年 youzhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,retain) IBOutlet UITextField *text;
@property (nonatomic,retain) IBOutlet UILabel *targetNum;
@property (nonatomic,retain) IBOutlet UILabel *resultDescription;
@property (nonatomic,retain) IBOutlet UILabel *lastNumber;
@property (nonatomic,retain) IBOutlet UILabel *caculateResult;
@property (nonatomic,retain) NumberManager *numGame;

@end
