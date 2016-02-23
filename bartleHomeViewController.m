//
//  bartleHomeViewController.m
//  Bartle Test
//
//  Created by Alexander Chai on 7/24/14.
//  Copyright (c) 2014 Punahou School. All rights reserved.
//

#import "bartleHomeViewController.h"

@interface bartleHomeViewController ()

@end

@implementation bartleHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takeQuiz:(id)sender {
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if (stdDefaults){
        [stdDefaults setObject:0 forKey:@"ExploreNum"];
        [stdDefaults setObject:0 forKey:@"AchieveNum"];
        [stdDefaults setObject:0 forKey:@"SocialNum"];
        [stdDefaults setObject:0 forKey:@"GrfNum"];
        [stdDefaults setObject:@"NA" forKey:@"Biggest Trait"];
        [stdDefaults synchronize];
}
}
- (IBAction)goHome:(UIStoryboardSegue*)unwindSegue{
    
}
@end
