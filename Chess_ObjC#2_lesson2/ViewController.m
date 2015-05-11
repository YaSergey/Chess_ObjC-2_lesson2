//
//  ViewController.m
//  Chess_ObjC#2_lesson2
//
//  Created by Sergey Yasnetsky on 10.05.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *someView;
@property (nonatomic, weak) UIImageView *boardWhiteView;

@property (nonatomic, weak) UIImageView *blackView;
@property (nonatomic, weak) UIView *imageView;
@property (nonatomic, assign) NSInteger widthSquare1;
@property (nonatomic, assign) NSInteger boardX;
@property (nonatomic, assign) NSInteger boardY;

@property (nonatomic, assign) NSInteger boardWidht;
@property (nonatomic, assign) NSInteger boardHeight;


@property (nonatomic, assign) CGPoint differencePoint;
@property (readonly, copy) NSString *bundlePath;
@property (nonatomic, strong) NSMutableArray * nameFiguriesArray;
@property (nonatomic, strong) NSMutableArray * imagesArrayBlackPawn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // контуры шахматной доски, размеры определены константами
    UIView * boardContur = [[UIView alloc] initWithFrame:CGRectMake(CONST_counturSize, CONST_counturSize, CONST_BoardSize, CONST_BoardSize)];
    boardContur.backgroundColor = [UIColor darkGrayColor];
    self.imageView = boardContur;
    [self.view addSubview:boardContur];
    boardContur.userInteractionEnabled = NO;
    
//     белое поле шахматной доски - привязано пропорционально к контурам доски
    
    UIView * boardWhiteView =[[UIView alloc] initWithFrame:
    CGRectMake(boardContur.frame.size.width/2 - boardContur.frame.size.width/2.65,
               boardContur.frame.size.height/2 - boardContur.frame.size.height/2.65,
               boardContur.frame.size.width*0.9, boardContur.frame.size.height*0.9)];
    
    boardWhiteView.backgroundColor = [[UIColor yellowColor]colorWithAlphaComponent:0.9];
    boardWhiteView.userInteractionEnabled = NO;

    
    self.imageView = boardWhiteView;
    [boardContur addSubview:boardWhiteView];
    
    self.widthSquare1 = (boardWhiteView.bounds.size.height/8);

    [MakeChessBoard makeChessBoard:boardWhiteView];
    [self.view addSubview:boardWhiteView];
    
    [AddFiguriesToBoard addFiguriesToBoard:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UIView* someAnotherView = [self.view hitTest:point withEvent:event];
    
    if (![someAnotherView isEqual:self.view]) {
        self.someView = someAnotherView;
        
        [self.view bringSubviewToFront:self.someView];
        
        UITouch * touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.someView];
        
        self.differencePoint = CGPointMake(CGRectGetMidX(self.someView.bounds)-point.x, CGRectGetMidY(self.someView.bounds)-point.y);
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.someView.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
            self.someView.alpha = 0.5;
        }];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (self.someView) {
        UITouch * touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        
        CGPoint mainPoint = CGPointMake(point.x + self.differencePoint.x, point.y + self.differencePoint.y);
        
        self.someView.center = mainPoint;
        
    }
    
    //    UITouch * touch = [touches anyObject];
    //    CGPoint pointMoved = [touch locationInView:self.view];
    //
    //    NSLog(@"touchesMoved %@", touch);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.someView.transform = CGAffineTransformIdentity;
        self.someView.alpha = 1.0;
    }];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
