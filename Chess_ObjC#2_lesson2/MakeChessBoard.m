//
//  MakeChessBoard.m
//  Chess_ObjC#2_lesson2
//
//  Created by Sergey Yasnetsky on 10.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "MakeChessBoard.h"


@implementation MakeChessBoard

+ (void) makeChessBoard: (UIView *) chessView {

    NSInteger widthSquare = (CONST_BoardSize / CONST_NumberOfLine)*0.9;
    NSInteger numberOfLineBlack = 0, numberOfLineWhite = 0;
    NSInteger x = 0, x1 = 0, y = 0, y1= 0;
    NSInteger numberSignPoint = 0, letterSign = 0;
    
    NSString * stringLetters = @"a,b,c,d,e,f,g,h"; //массив букв - для подписи полей
    
    NSArray * arrayLetteres = [stringLetters componentsSeparatedByString:@","];
    
    
// Цикл формирования черных клеток ===================================

    for (NSInteger i =0; i < CONST_NumberOfLine; i++) {
        for (NSInteger j= 0 ; j < CONST_NumberOfLine; j=j+2) {
            
            if (numberOfLineBlack % 2) {
                y = widthSquare * j + widthSquare;
                x = widthSquare * numberOfLineBlack;
            } else {
                y = widthSquare * j;
                x = widthSquare * numberOfLineBlack;
            }
            UIImageView * boardBlackView = [[UIImageView alloc] initWithFrame:CGRectMake(x+3, y+3, widthSquare, widthSquare)];
            boardBlackView.backgroundColor = [UIColor blackColor];
            [chessView addSubview: boardBlackView];
            
        }

        numberOfLineBlack ++;
        
        NSLog(@"numberOfLine %ld" , (long)numberOfLineBlack);
        
        
//нумерация шахматных линий от 1 до 8 ====================================
        
        UILabel * textLineNumber =
        [[UILabel alloc] initWithFrame:CGRectMake(-20, 30+numberSignPoint, 20, 20)];
        
        textLineNumber.text = [NSString stringWithFormat:@"%li", (long)numberOfLineBlack];
        textLineNumber.textColor = [UIColor yellowColor];
        [chessView addSubview:textLineNumber];
        
        numberSignPoint = numberSignPoint + widthSquare;

//буквенные обозначения шахматных линий от A до h ==========================
        
        UILabel * textLetterSign =
        [[UILabel alloc] initWithFrame:CGRectMake(30+letterSign, -25, 20, 20)];
        
        textLetterSign.text = [arrayLetteres objectAtIndex: i];
        textLetterSign.textColor = [UIColor yellowColor];
        [chessView addSubview:textLetterSign];
  
        letterSign = letterSign + widthSquare;
    }

// Цикл формирования белых клеток ========================================
        
        for (NSInteger i1 =0; i1 < CONST_NumberOfLine; i1++) {
            for (NSInteger j1= 0 ; j1 < CONST_NumberOfLine; j1=j1+2) {
                
                if (numberOfLineWhite%2) {
                    y1 = widthSquare * j1;
                    x1 = widthSquare * numberOfLineWhite;
                } else {
                    y1 = widthSquare * j1 + widthSquare;
                    x1 = widthSquare * numberOfLineWhite;
                }
                UIImageView * boardWhiteView = [[UIImageView alloc] initWithFrame:CGRectMake(x1+3, y1+3, widthSquare, widthSquare)];
                boardWhiteView.backgroundColor = [UIColor yellowColor];
                [chessView addSubview: boardWhiteView];
            }
            
            numberOfLineWhite ++;
            
            NSLog(@"numberOfLine %ld" , (long)numberOfLineWhite);
    }
}

@end
