//
//  bartleHomeViewController.h
//  Bartle Test
//
//  Created by Alexander Chai on 7/24/14.
//  Copyright (c) 2014 Punahou School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bartleHomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *taketheQuizButton;
- (IBAction)takeQuiz:(id)sender;

@end
