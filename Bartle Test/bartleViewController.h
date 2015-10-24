//
//  bartleViewController.h
//  Bartle Test
//
//  Created by Alex Chai on 11/16/13.
//  Copyright (c) 2013-2015 Punahou School. All rights reserved.
//THIS IS THE RELEASE V

#import <UIKit/UIKit.h>

@interface bartleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionNum;
@property (weak, nonatomic) IBOutlet UIProgressView *progBar;
@property (weak, nonatomic) IBOutlet UITextView *question;

//Refer everything to questionLabel from now on
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UIButton *select1Button;
@property (weak, nonatomic) IBOutlet UIButton *select2Button;

@property (weak, nonatomic) IBOutlet UILabel *s1Label;
@property (weak, nonatomic) IBOutlet UILabel *s2Label;


@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nexButton;
@property (weak, nonatomic) IBOutlet UIButton *showUnfinishedInfoButton;

//Sideicon will display the result icon
@property (weak, nonatomic) IBOutlet UIImageView *sideIcon;
//Note: quizScrollingDescriptionLabel is the actual label detailing the nature of the user. mainTitleLabel is the "you're a"
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *quizScrollingDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *initialScrollingDescriptionLabel;
//startQuizLabel will change to "take the test again" after usage
@property (weak, nonatomic) IBOutlet UIButton *startQuizLabel;

@property (weak, nonatomic) IBOutlet UILabel *exPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *acPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *soPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *kiPercentLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *exBar;
//Admiral acBar
@property (weak, nonatomic) IBOutlet UIProgressView *acBar;
@property (weak, nonatomic) IBOutlet UIProgressView *kiBar;
@property (weak, nonatomic) IBOutlet UIProgressView *socBar;



- (IBAction)select1:(id)sender;
- (IBAction)select2:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)nex:(id)sender;
- (IBAction)exit:(id)sender;
- (IBAction)pushToSafari;
- (IBAction)emailRes:(id)sender;
- (IBAction)showUnfinishedInfo:(id)sender;

@end
