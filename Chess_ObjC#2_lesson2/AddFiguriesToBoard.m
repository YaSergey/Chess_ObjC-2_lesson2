//
//  AddFiguriesToBoard.m
//  Chess_ObjC#2_lesson2
//
//  Created by Sergey Yasnetsky on 11.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "AddFiguriesToBoard.h"

@implementation AddFiguriesToBoard

+ (void) addFiguriesToBoard: (UIView *) figView {

    NSInteger widthSquare = (CONST_BoardSize / CONST_NumberOfLine);

// массив расставления  черных пешек=======================
    
    NSMutableArray * blackPawnArr = [[NSMutableArray alloc] init];
    UIImage * blackPawn = [UIImage imageNamed: [NSString stringWithFormat:@"blackPawn.jpg"]];
    
    
    for (int i = 0; i <8 ; i++) {
        [blackPawnArr addObject:blackPawn];
    

        UIView * figureView =
            [[UIView alloc] initWithFrame:CGRectMake(1.9*CONST_counturSize+widthSquare*i*0.905, 1.7*CONST_counturSize+widthSquare, widthSquare*0.7, widthSquare*0.7)];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:figureView.bounds];
            
        imageView.image = [blackPawnArr objectAtIndex:i];
        
        [figureView addSubview:imageView];
        [figView addSubview:figureView];
        
            }
    


// массив расставления белых пешек =======================

    NSMutableArray * whitePawnArr = [[NSMutableArray alloc] init];
    UIImage * whitePawn = [UIImage imageNamed: [NSString stringWithFormat:@"blackPawn.jpg"]];

    for (int i = 0; i <8 ; i++) {
        [whitePawnArr addObject:whitePawn];

    UIView * figureView =
    [[UIView alloc] initWithFrame:CGRectMake(1.9*CONST_counturSize+widthSquare*i*0.905, 1.9*CONST_counturSize+widthSquare*5.4, widthSquare*0.7, widthSquare*0.7)];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:figureView.bounds];
    
    imageView.image = [whitePawnArr objectAtIndex:i];
    
    [figureView addSubview:imageView];
    [figView addSubview:figureView];
    
    }

// массив основных белых фигур ============================
    
    NSMutableArray * whiteFiguriesArray = [[NSMutableArray alloc] init];
    
    UIImage * whiteRook = [UIImage imageNamed: [NSString stringWithFormat:@"blackRook.jpg"]];
    UIImage * whiteKnight = [UIImage imageNamed: [NSString stringWithFormat:@"blackKnight.jpg"]];
    UIImage * whiteBishop = [UIImage imageNamed: [NSString stringWithFormat:@"blackBishop.jpg"]];
    UIImage * whiteQueen = [UIImage imageNamed: [NSString stringWithFormat:@"blackQueen.jpg"]];
    UIImage * whiteKing = [UIImage imageNamed: [NSString stringWithFormat:@"blackKing.jpg"]];


    [whiteFiguriesArray addObject:whiteRook];
    [whiteFiguriesArray addObject:whiteKnight];
    [whiteFiguriesArray addObject:whiteBishop];
    [whiteFiguriesArray addObject:whiteQueen];
    [whiteFiguriesArray addObject:whiteKing];
    [whiteFiguriesArray addObject:whiteBishop];
    [whiteFiguriesArray addObject:whiteKnight];
    [whiteFiguriesArray addObject:whiteRook];

    NSLog(@"whiteFiguriesArray %lu", (unsigned long)whiteFiguriesArray.count);
    
    for (int i = 0 ; i < whiteFiguriesArray.count; i++) {
    
        UIView * figureView1 =
        [[UIView alloc] initWithFrame:CGRectMake(1.9*CONST_counturSize+widthSquare*i*0.905, 1.9*CONST_counturSize+widthSquare*0.01, widthSquare*0.7, widthSquare*0.7)];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:figureView1.bounds];
        
        imageView.image = [whiteFiguriesArray objectAtIndex:i];
        
        [figureView1 addSubview:imageView];
        [figView addSubview:figureView1];
    
    }
    // массив основных черных фигур ============================
    
    NSMutableArray * blackFiguriesArray = [[NSMutableArray alloc] init];
    
    UIImage * blackRook = [UIImage imageNamed: [NSString stringWithFormat:@"blackRook.jpg"]];
    UIImage * blackKnight = [UIImage imageNamed: [NSString stringWithFormat:@"blackKnight.jpg"]];
    UIImage * blackBishop = [UIImage imageNamed: [NSString stringWithFormat:@"blackBishop.jpg"]];
    UIImage * blackQueen = [UIImage imageNamed: [NSString stringWithFormat:@"blackQueen.jpg"]];
    UIImage * blackKing = [UIImage imageNamed: [NSString stringWithFormat:@"blackKing.jpg"]];
    
    
    [blackFiguriesArray addObject:blackRook];
    [blackFiguriesArray addObject:blackKnight];
    [blackFiguriesArray addObject:blackBishop];
    [blackFiguriesArray addObject:blackQueen];
    [blackFiguriesArray addObject:blackKing];
    [blackFiguriesArray addObject:blackBishop];
    [blackFiguriesArray addObject:blackKnight];
    [blackFiguriesArray addObject:blackRook];
    
    NSLog(@"blackFiguriesArray %lu", (unsigned long)blackFiguriesArray.count);
    
    for (int i = 0 ; i < blackFiguriesArray.count; i++) {
        
        UIView * figureView1 =
        [[UIView alloc] initWithFrame:CGRectMake(1.9*CONST_counturSize+widthSquare*i*0.905, 1.9*CONST_counturSize+widthSquare*6.3, widthSquare*0.7, widthSquare*0.7)];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:figureView1.bounds];
        
        imageView.image = [blackFiguriesArray objectAtIndex:i];
        
        [figureView1 addSubview:imageView];
        [figView addSubview:figureView1];
        
    }




}








@end
