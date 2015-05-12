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
    
    // определение переменных размеров и координат доски =================
    NSInteger widthSquare = (CONST_BoardSize / CONST_NumberOfLine)*0.9;
    NSInteger numberOfLineBlack = 0, numberOfLineWhite = 0;
    NSInteger x = 0, x1 = 0, y = 0, y1= 0;
    NSInteger numberSignPoint = 0, letterSign = 0;
    
    NSString * stringLetters = @"A,B,C,D,E,F,G,H"; //массив букв - для подписи полей
    
    NSArray * arrayLetteres = [stringLetters componentsSeparatedByString:@","];
    
    UIImage * imageWhiteSquere = [UIImage imageNamed:@"whiteSquere.jpg"];
    UIImage * imageBlackSquere = [UIImage imageNamed:@"blackSquere.jpg"];
    
// формирование осноновной и дочерней вью для встраивания шахматной доски ===============

    
// контуры шахматной доски, размеры определены константами ==================
    
    UIView * boardContur = [[UIView alloc] initWithFrame:CGRectMake(CONST_counturSize, CONST_counturSize, CONST_BoardSize, CONST_BoardSize)];
    UIImageView * imageViewWood = [[UIImageView alloc] initWithFrame:boardContur.bounds];
    
    imageViewWood.image = imageBlackSquere;
    [boardContur addSubview:imageViewWood];
    
//  boardContur.backgroundColor = [UIColor darkGrayColor];
    
    chessView.maskView = boardContur;
    [chessView addSubview:boardContur];
    boardContur.userInteractionEnabled = NO;
    
// поле шахматной доски - привязано пропорционально к контурам доски
    
    UIView * chessFieldView = [[UIView alloc] initWithFrame:CGRectMake(CONST_counturSize*0.75, CONST_counturSize*0.75, CONST_BoardSize*0.9, CONST_BoardSize*0.9)];
    
//    UIView * chessFieldView =[[UIView alloc] initWithFrame: CGRectMake
//    (boardContur.frame.size.width/2 - boardContur.frame.size.width/2.65,
//    boardContur.frame.size.height/2 - boardContur.frame.size.height/2.65,
//    boardContur.frame.size.width*0.9, boardContur.frame.size.height*0.9)];
    
    UIImageView * imageViewWoodWhite = [[UIImageView alloc] initWithFrame:chessFieldView.bounds];
    
    imageViewWoodWhite.image = imageWhiteSquere;
    [chessFieldView addSubview:imageViewWoodWhite];
    
    chessFieldView.backgroundColor = [[UIColor yellowColor]colorWithAlphaComponent:0.0];
    chessFieldView.userInteractionEnabled = NO; // отключение методов по движению view
    
    
    chessView.maskView = chessFieldView;
    [boardContur addSubview:chessFieldView];
    
//    widthSquare = (boardWhiteView.bounds.size.height/8);
    
    
    
    
    
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
UIView * boardBlackView = [[UIView alloc] initWithFrame:CGRectMake(x+3, y+3, widthSquare, widthSquare)];
UIImageView * imageView = [[UIImageView alloc]initWithFrame:boardBlackView.bounds];
// добавление фона как изборажения

    imageView.image = imageBlackSquere;
    [boardBlackView addSubview:imageView];
    [chessFieldView addSubview: boardBlackView];
    boardBlackView.userInteractionEnabled = NO; // отключение методов по движению view

//    boardBlackView.backgroundColor = [UIColor blackColor];

            
        }

        numberOfLineBlack ++;
        
        NSLog(@"numberOfLine %ld" , (long)numberOfLineBlack);
        
        
//=нумерация шахматных линий от 1 до 8 ====================================
        
        UILabel * textLineNumberLeft =
        [[UILabel alloc] initWithFrame:CGRectMake(-20, 30+numberSignPoint, 20, 20)];
        
        textLineNumberLeft.text = [NSString stringWithFormat:@"%li", (long)numberOfLineBlack];
        textLineNumberLeft.textColor = [UIColor yellowColor];
        [chessFieldView addSubview:textLineNumberLeft];
        
        UILabel * textLineNumberRight =
        [[UILabel alloc] initWithFrame:CGRectMake(widthSquare*8.2, 30+numberSignPoint, 20, 20)];
        
        textLineNumberRight.text = [NSString stringWithFormat:@"%li", (long)numberOfLineBlack];
        textLineNumberRight.textColor = [UIColor yellowColor];
        [chessFieldView addSubview:textLineNumberRight];
        
        numberSignPoint = numberSignPoint + widthSquare;

//=буквенные обозначения шахматных линий от A до h ==========================
//на верху доски
        UILabel * textLetterSignUp =
        [[UILabel alloc] initWithFrame:CGRectMake(30+letterSign, -25, 20, 20)];
        
        textLetterSignUp.text = [arrayLetteres objectAtIndex: i];
        textLetterSignUp.textColor = [UIColor yellowColor];
        [chessFieldView addSubview:textLetterSignUp];
        
        //и в ее нижней части доски

        UILabel * textLetterSignFutter =
        [[UILabel alloc] initWithFrame:CGRectMake(30+letterSign,widthSquare*8.1, 20, 20)];
        
        textLetterSignFutter.text = [arrayLetteres objectAtIndex: i];
        textLetterSignFutter.textColor = [UIColor yellowColor];
        [chessFieldView addSubview:textLetterSignFutter];
        
        letterSign = letterSign + widthSquare;
    }

//=Цикл формирования белых клеток ========================================
        
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

//добавление изображения как фона
UIImageView * imageView = [[UIImageView alloc]initWithFrame:boardWhiteView.bounds];
                
imageView.image = imageWhiteSquere;
//boardWhiteView.backgroundColor = [UIColor yellowColor];
[boardWhiteView addSubview:imageView];
[chessFieldView addSubview: boardWhiteView];
            }
            
            numberOfLineWhite ++;
            
            NSLog(@"numberOfLine %ld" , (long)numberOfLineWhite);
    }
}

@end
