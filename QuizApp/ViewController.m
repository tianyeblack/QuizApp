//
//  ViewController.m
//  QuizApp
//
//  Created by Ye Tian on 24/10/2016.
//  Copyright © 2016 Ye Tian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSArray *questions;
@property (nonatomic) NSArray *answers;
@property (weak, nonatomic) IBOutlet UILabel * questionLabel;
@property (weak, nonatomic) IBOutlet UILabel * answerLabel;
@property (nonatomic) int currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.questions = @[@"What is 2 + 2?",
                       @"What is 1 + 1?",
                       @"What is the capital of Georgia?"];
    
    self.answers = @[@"4",
                     @"2",
                     @"Atlanta"];
    
    self.questionLabel.text = self.questions[self.currentIndex];
}

- (void) viewWillAppear: (BOOL) animated {
  [super viewWillAppear: animated];
  _questionLabel.alpha = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) animateLabelTransitions {
  [UIView animateWithDuration: 0.5 animations:^{
    _questionLabel.alpha = 1.0;
  }];
}

#pragma mark - Actions
- (IBAction)showNextQuestion: (UIButton *)sender {
  self.currentIndex++;
  
  if (self.currentIndex >= self.questions.count) {
    self.currentIndex = 0;
  }
  
  self.questionLabel.text = self.questions[self.currentIndex];
  self.answerLabel.text = @"???";
  
  [self animateLabelTransitions];
}

- (IBAction)showAnswer:(UIButton *)sender {
  self.answerLabel.text = self.answers[self.currentIndex];
}

@end
