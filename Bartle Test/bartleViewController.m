//
//  bartleViewController.m
//  Bartle Test
//
//  Created by Alex Chai on 11/16/13.
//  Copyright (c) 2013 Punahou School. All rights reserved.
//

#import "bartleViewController.h"
#import "bartleQuestion.h"

@interface bartleViewController ()

@end

@implementation bartleViewController

int qNum = 1;
int totalNumQ = 0;
int exploreNum = 0;
int socialNum =0;
int achieveNum = 0;
int killNum = 0;
int amtMod = 0;
bool unfinishedAndChecked;
int notFinishedNum;

//  bartleViewController.m
//  Bartle Test
//
//  Created by Alex Chai on 11/16/13.
//  Copyright (c) 2013 Punahou School. All rights reserved.
//

#import "bartleViewController.h"
#import "bartleQuestion.h"


NSMutableArray *questions;
NSMutableArray *answers;
NSMutableArray *answerTypes;

-(void)loadQuestions {
    
    //Prep the Question
    
    questions = [[NSMutableArray alloc] init];
    
    bartleQuestion *moreComfyMMORPG = [[bartleQuestion alloc] init];
    moreComfyMMORPG.question = @"Are you more comfortable:";
    moreComfyMMORPG.ans1 = @"Out hunting orcs by yourself for experience?";
    moreComfyMMORPG.ans2 = @"Talking with friends in a Tavern?";
    moreComfyMMORPG.ans1Type = @"a";
    moreComfyMMORPG.ans2Type = @"s";
    
    bartleQuestion *moreEnjoyable = [[bartleQuestion alloc] init];
    moreEnjoyable.question = @"Which is more enjoyable to you?";
    moreEnjoyable.ans1 = @"Killing a big monster?";
    moreEnjoyable.ans2 = @"Bragging about it to your friends?";
    moreEnjoyable.ans1Type = @"a";
    moreEnjoyable.ans2Type = @"s";
    
    bartleQuestion *MMORPGquests = [[bartleQuestion alloc] init];
    MMORPGquests.question = @"Which do you enjoy more in quests:";
    MMORPGquests.ans1 = @"Getting the rewards at the end?";
    MMORPGquests.ans2 = @"Getting involved in the storyline?";
    MMORPGquests.ans1Type = @"a";
    MMORPGquests.ans2Type = @"s";
    
    bartleQuestion *noticed = [[bartleQuestion alloc] init];
    noticed.question = @"Which would you rather be noticed for in a game";
    noticed.ans1 = @"Your equipment";
    noticed.ans2 = @"Your personality";
    noticed.ans1Type = @"a";
    noticed.ans2Type = @"s";
    
    bartleQuestion *ratherBe = [[bartleQuestion alloc] init];
    ratherBe.question = @"Would you rather be:";
    ratherBe.ans1 = @"Popular?";
    ratherBe.ans2 = @"Wealthy?";
    ratherBe.ans1Type = @"s";
    ratherBe.ans2Type = @"a";
    
    bartleQuestion *gossipItem = [[bartleQuestion alloc] init];
    gossipItem.question = @"Which do you enjoy more?";
    gossipItem.ans1 = @"Getting the latest gossip";
    gossipItem.ans2 = @"Getting a new item";
    gossipItem.ans1Type = @"s";
    gossipItem.ans2Type = @"a";
    
    bartleQuestion *ratherHaveMMORPG = [[bartleQuestion alloc] init];
    ratherHaveMMORPG.question = @"Which would you rather have, as a player?";
    ratherHaveMMORPG.ans1 = @"Your own house, with millions of gold coins?";
    ratherHaveMMORPG.ans2 = @"A private channel, over which you and your friends can communicate?";
    ratherHaveMMORPG.ans1Type = @"a";
    ratherHaveMMORPG.ans2Type = @"s";
    
    bartleQuestion *MMORPGEnjoyMore = [[bartleQuestion alloc] init];
    MMORPGEnjoyMore.question = @"Which would you enjoy more?";
    MMORPGEnjoyMore.ans1 = @"Making your own maps of the world, then selling them?";
    MMORPGEnjoyMore.ans2 = @"Running your own tavern?";
    MMORPGEnjoyMore.ans1Type = @"e";
    MMORPGEnjoyMore.ans2Type = @"s";
    
    bartleQuestion *MMORPGMoreImportant = [[bartleQuestion alloc] init];
    MMORPGMoreImportant.question = @"What's more important to you?";
    MMORPGMoreImportant.ans1 = @"The number of areas to explore?";
    MMORPGMoreImportant.ans2 = @"The number of people?";
    MMORPGMoreImportant.ans1Type = @"e";
    MMORPGMoreImportant.ans2Type = @"s";
    
    bartleQuestion *qualityUnique = [[bartleQuestion alloc] init];
    qualityUnique.question = @"What's more important to you?";
    qualityUnique.ans1 = @"The quality of roleplaying in a multiplayer game";
    qualityUnique.ans2 = @"The uniqueness of the features, and game mechanic";
    qualityUnique.ans1Type = @"s";
    qualityUnique.ans2Type = @"e";

    bartleQuestion *monsterChase = [[bartleQuestion alloc] init];
    monsterChase.question = @"You are being chased by a monster on an MMORPG. Do you:";
    monsterChase.ans1 = @"Ask a friend for help in killing it?";
    monsterChase.ans2 = @"Hide someplace where you know the monster won't follow you?";
    monsterChase.ans1Type = @"s";
    monsterChase.ans2Type = @"e";

    bartleQuestion *dragon = [[bartleQuestion alloc] init];
    dragon.question = @"You want to buy a really tough dragon. How would you approach this problem?";
    dragon.ans1 = @"Get a big group of players to kill it?";
    dragon.ans2 = @"Try a variety of weapons and magic against it, until you find its weakness?";
    dragon.ans1Type = @"s";
    dragon.ans2Type = @"e";

    bartleQuestion *dungeon = [[bartleQuestion alloc] init];
    dungeon.question = @"You're about to go into an unknown dungeon. You have your choice of one more person for your party:";
    dungeon.ans1 = @"A bard, who's a good friend of yours and who's great for entertaining you and your friends?";
    dungeon.ans2 = @"A wizard, to identify the items you find there?";
    dungeon.ans1Type = @"s";
    dungeon.ans2Type = @"e";
    
    bartleQuestion *lovedFeared = [[bartleQuestion alloc] init];
    lovedFeared.question = @"It is better to be:";
    lovedFeared.ans1 = @"Loved";
    lovedFeared.ans2 = @"Feared";
    lovedFeared.ans1Type = @"s";
    lovedFeared.ans2Type = @"k";

    bartleQuestion *killedYou = [[bartleQuestion alloc] init];
    killedYou.question = @"Another player has killed you. Do you want to:";
    killedYou.ans1 = @"Find out why, and try to convince them not to do it again?";
    killedYou.ans2 = @"Plot your revenge?";
    killedYou.ans1Type = @"s";
    killedYou.ans2Type = @"k";
    
    
    bartleQuestion *moreExciting = [[bartleQuestion alloc] init];
    moreExciting.question = @"Which is more exciting?";
    moreExciting.ans1 = @"A well-roleplayed scenario";
    moreExciting.ans2 = @"A deadly battle";
    moreExciting.ans1Type = @"s";
    moreExciting.ans2Type = @"k";
    
    bartleQuestion *enjoyMore = [[bartleQuestion alloc] init];
    enjoyMore.question = @"Which would you enjoy more?";
    enjoyMore.ans1 = @"Getting accepted by a guild or clan?";
    enjoyMore.ans2 = @"Winning a duel with another player?";
    enjoyMore.ans1Type = @"s";
    enjoyMore.ans2Type = @"k";

    bartleQuestion *enemies = [[bartleQuestion alloc] init];
    enemies.question = @"Would you rather";
    enemies.ans1 = @"Vanquish your enemies?";
    enemies.ans2 = @"Convince your enemies to work for you, not against you?";
    enemies.ans1Type = @"k";
    enemies.ans2Type = @"s";

    bartleQuestion *whatsWorse = [[bartleQuestion alloc] init];
    whatsWorse.question = @"What's Worse?";
    whatsWorse.ans1 = @"To be without friends?";
    whatsWorse.ans2 = @"To be without power?";
    whatsWorse.ans1Type = @"s";
    whatsWorse.ans2Type = @"k";
    
    bartleQuestion *wouldRather = [[bartleQuestion alloc] init];
    wouldRather.question = @"Would you rather:";
    wouldRather.ans1 = @"Show them the sharp blade of your axe?";
    wouldRather.ans2 = @"Hear what someone has to say?";
    wouldRather.ans1Type = @"k";
    wouldRather.ans2Type = @"s";

    bartleQuestion *lookForward = [[bartleQuestion alloc] init];
    lookForward.question = @"On an MMORPG, a new area opens up. Which do you look forward to more?";
    lookForward.ans1 = @"Being the first to get the new equipment from the area?";
    lookForward.ans2 = @"Exploring the new area, and finding out its history?";
    lookForward.ans1Type = @"a";
    lookForward.ans2Type = @"e";

    bartleQuestion *ratherBeKnown = [[bartleQuestion alloc] init];
    ratherBeKnown.question = @"On an MMORPG would you rather be known as:";
    ratherBeKnown.ans1 = @"Somone who can run between any two points in the world and really knows their way around?";
    ratherBeKnown.ans2 = @"The person with the best, most unique equipment in the game?";
    ratherBeKnown.ans1Type = @"e";
    ratherBeKnown.ans2Type = @"a";
    
    bartleQuestion *becomeHero =[[bartleQuestion alloc] init];
    becomeHero.question = @"Would you rather:";
    becomeHero.ans1 = @"Become a hero faster than your friends?";
    becomeHero.ans2 = @"Know more secrets than your friends?";
    becomeHero.ans1Type = @"a";
    becomeHero.ans2Type = @"e";
    
    bartleQuestion *findGet =[[bartleQuestion alloc] init];
    findGet.question = @"Would you rather:";
    findGet.ans1 = @"Know where to find things";
    findGet.ans2 = @"Know how to get things";
    findGet.ans1Type = @"e";
    findGet.ans2Type = @"a";
    
    bartleQuestion *ratherDo = [[bartleQuestion alloc] init];
    ratherDo.question = @"Which would you rather do:";
    ratherDo.ans1 = @"Get to a certain experience level faster than anyone else?";
    ratherDo.ans2 = @"Solve a riddle no one else has gotten?";
    ratherDo.ans1Type = @"a";
    ratherDo.ans2Type = @"e";
    
    bartleQuestion *knowHave = [[bartleQuestion alloc] init];
    knowHave.question = @"Do you tend to:";
    knowHave.ans1 = @"Know things nobody else does";
    knowHave.ans2 = @"Have items nobody else does";
    knowHave.ans1Type = @"e";
    knowHave.ans2Type = @"a";
    
    bartleQuestion *clan = [[bartleQuestion alloc] init];
    clan.question = @"In the game world, would you rather join a clan of:";
    clan.ans1 = @"Scholars";
    clan.ans2 = @"Assassins";
    clan.ans1Type = @"e";
    clan.ans2Type = @"k";
    
    bartleQuestion *ratherWin = [[bartleQuestion alloc] init];
    ratherWin.question = @"Would you rather win:";
    ratherWin.ans1 = @"An arena battle?";
    ratherWin.ans2 = @"A trivia contest?";
    ratherWin.ans1Type = @"k";
    ratherWin.ans2Type = @"e";
    
    bartleQuestion *alone = [[bartleQuestion alloc] init];
    alone.question = @"If you're alone in an area, do you think:";
    alone.ans1 = @"You'll have to look elsewhere for prey?";
    alone.ans2 = @"It's safe to explore?";
    alone.ans1Type = @"k";
    alone.ans2Type = @"e";
    
    bartleQuestion *knowledgePower = [[bartleQuestion alloc] init];
    knowledgePower.question = @"In the game world, would you rather be known for";
    knowledgePower.ans1 = @"Knowledge";
    knowledgePower.ans2 = @"Power";
    knowledgePower.ans1Type = @"e";
    knowledgePower.ans2Type = @"k";
    
    bartleQuestion *wouldYouRather = [[bartleQuestion alloc] init];
    wouldYouRather.question = @"Would you rather:";
    wouldYouRather.ans1 = @"Defeat an enemy?";
    wouldYouRather.ans2 = @"Explore a new area?";
    wouldYouRather.ans1Type = @"k";
    wouldYouRather.ans2Type = @"e";
    
    bartleQuestion *demise = [[bartleQuestion alloc] init];
    demise.question = @"You learned that another player is planning your demise. Do you:";
    demise.ans1 = @"Attack him before he attacks you?";
    demise.ans2 = @"Go to an area your opponent is unfamiliar with and prepare there?";
    demise.ans1Type = @"k";
    demise.ans2Type = @"e";
    
    bartleQuestion *newPlayer = [[bartleQuestion alloc] init];
    newPlayer.question = @"You meet a new player. Do you think of him as:";
    newPlayer.ans1 = @"Someone who can appreciate your knowledge of the game?";
    newPlayer.ans2 = @"Potential prey?";
    newPlayer.ans1Type = @"s";
    newPlayer.ans2Type = @"k";
    
    bartleQuestion *swordFeared = [[bartleQuestion alloc] init];
    swordFeared.question = @"In the game world, would you rather:";
    swordFeared.ans1 = @"Have a sword twice as powerful as any other in the game";
    swordFeared.ans2 = @"Be the most feared person in the game";
    swordFeared.ans1Type = @"a";
    swordFeared.ans2Type = @"k";
    
    bartleQuestion *MMORPGBrag = [[bartleQuestion alloc] init];
    MMORPGBrag.question = @"Would you be more prone to brag about:";
    MMORPGBrag.ans1 = @"How many other players you've killed?";
    MMORPGBrag.ans2 = @"Your equipment?";
    MMORPGBrag.ans1Type = @"k";
    MMORPGBrag.ans2Type = @"a";
    
    bartleQuestion *ratherHaveSpell = [[bartleQuestion alloc] init];
    ratherHaveSpell.question = @"Would you rather have:";
    ratherHaveSpell.ans1 = @"A spell that increases the rate at which you gain experience points?";
    ratherHaveSpell.ans2 = @"A spell to damage other players?";
    ratherHaveSpell.ans1Type = @"a";
    ratherHaveSpell.ans2Type = @"k";
    
    bartleQuestion *ratherHave = [[bartleQuestion alloc] init];
    ratherHave.question = @"Would you rather have:";
    ratherHave.ans1 = @"Two levels of experience?";
    ratherHave.ans2 = @"An amulet that increases the damage you do against other players by 10%?";
    ratherHave.ans1Type = @"a";
    ratherHave.ans2Type = @"k";

    bartleQuestion *questReward = [[bartleQuestion alloc] init];
    questReward.question = @"Would you rather receive as a quest reward:";
    questReward.ans1 = @"Experience points?";
    questReward.ans2 = @"A wand with three charges of a spell that lets you control other players against their will?";
    questReward.ans1Type = @"a";
    questReward.ans2Type = @"k";

    bartleQuestion *scoreFriend = [[bartleQuestion alloc] init];
    scoreFriend.question = @"When playing a video game, is it more fun to:";
    scoreFriend.ans1 = @"Have the highest score on the list";
    scoreFriend.ans2 = @"Beat your best friend one-on-one";
    scoreFriend.ans1Type = @"a";
    scoreFriend.ans2Type = @"k";
    
    [questions insertObject:@"Zero" atIndex:0];
    [questions insertObject:moreComfyMMORPG atIndex:1];
    [questions insertObject:moreEnjoyable atIndex:2];
    [questions insertObject:MMORPGquests atIndex:3];
    [questions insertObject:noticed atIndex:4];
    [questions insertObject:ratherBe atIndex:5];
    [questions insertObject:gossipItem atIndex:6];
    [questions insertObject:ratherHaveMMORPG atIndex:7];
    [questions insertObject:MMORPGEnjoyMore atIndex:8];
    [questions insertObject:MMORPGMoreImportant atIndex:9];
    [questions insertObject:qualityUnique atIndex:10];
    [questions insertObject:monsterChase atIndex:11];
    [questions insertObject:dragon atIndex:12];
    [questions insertObject:dungeon atIndex:13];
    [questions insertObject:lovedFeared atIndex:14];
    [questions insertObject:killedYou atIndex:15];
    [questions insertObject:moreExciting atIndex:16];
    [questions insertObject:enjoyMore atIndex:17];
    [questions insertObject:enemies atIndex:18];
    [questions insertObject:whatsWorse atIndex:19];
    [questions insertObject:wouldRather atIndex:20];
    [questions insertObject:lookForward atIndex:21];
    [questions insertObject:ratherBeKnown atIndex:22];
    [questions insertObject:becomeHero atIndex:23];
    [questions insertObject:findGet atIndex:24];
    [questions insertObject:ratherDo atIndex:25];
    [questions insertObject:knowHave atIndex:26];
    [questions insertObject:clan atIndex:27];
    [questions insertObject:ratherWin atIndex:28];
    [questions insertObject:alone atIndex:29];
    [questions insertObject:knowledgePower atIndex:30];
    [questions insertObject:wouldYouRather atIndex:31];
    [questions insertObject:demise atIndex:32];
    [questions insertObject:newPlayer atIndex:33];
    [questions insertObject:swordFeared atIndex:34];
    [questions insertObject:MMORPGBrag atIndex:35];
    [questions insertObject:ratherHaveSpell atIndex:36];
    [questions insertObject:ratherHave atIndex:37];
    [questions insertObject:questReward atIndex:38];
    [questions insertObject:scoreFriend atIndex:39];
    
    totalNumQ = [questions count]-1;
    notFinishedNum = totalNumQ;
    unfinishedAndChecked=false;
    
    
}


-(void)prepQuestion {
    
    bartleQuestion *current = [questions objectAtIndex:(NSUInteger)qNum];
    
    NSString *qNumString = [NSString stringWithFormat:@"%d",qNum];
    
    self.questionNum.text = [[@"Question " stringByAppendingString:qNumString] stringByAppendingString:@" of 39"];
    float progressFloat = ((float)qNum/([questions count]-1));

    
    [self.progBar setProgress:progressFloat];
    
    self.questionLabel.text=current.question;
    self.s1Label.text = current.ans1;
    self.s2Label.text = current.ans2;
    
    //selCol is the color of the selected answer, blnkCol is the button color
    UIColor *selCol = [UIColor colorWithRed:(.95) green:(.95) blue:(1) alpha:(1)];
    UIColor *blnkCol = [UIColor colorWithRed:(.97) green:(.97) blue:(.97) alpha:(1)];
    
    //Setting Button colors
    if ([[answers objectAtIndex:qNum] isEqual:@"NA"]){
        self.select2Button.backgroundColor = blnkCol;
        self.select1Button.backgroundColor = blnkCol;
    }
    
    else if ([[answers objectAtIndex:qNum] isEqual:@"A1"]){
        self.select2Button.backgroundColor = blnkCol;
        self.select1Button.backgroundColor = selCol;
    }
    
    else if ([[answers objectAtIndex:qNum] isEqual:@"A2"]){
        self.select2Button.backgroundColor = selCol;
        self.select1Button.backgroundColor = blnkCol;
    }
    
    //Dealing with back/forward buttons
    if(qNum==1){
        [_prevButton setTitle:@" " forState:UIControlStateNormal];
    }
    else if(qNum!=1){
        [_prevButton setTitle:@"←" forState:UIControlStateNormal];
    }
    
    
    
}

//Returns yes if all questions are answered or no if they are not AND will update showUnfinishedINfo button HOWEVER it does this unconditionally
-(BOOL)finishedAll {
    
    //Check to see if all questions are answered
    
    if(notFinishedNum!=0){
        
        [self.showUnfinishedInfoButton setTitle:[NSString stringWithFormat:@"Sorry, %i question(s) still need to be answered.",notFinishedNum] forState:UIControlStateNormal];
        
        return false;
    }
    else{
        
        [self.showUnfinishedInfoButton setTitle:@"" forState:UIControlStateNormal];
        return true;
    }
}

//This Updates the showUnfinishedInfo, but ONLY if it is non-blank
-(void)UpdateUnfinishedQuestionLabel{
    
    if (unfinishedAndChecked) {
        [self finishedAll];
    }
    
}


-(void)segueToResult:(NSString *)resId{
    CGFloat scrnWidth = [[UIScreen mainScreen] bounds].size.width;
    NSLog(@"%f",scrnWidth);

    
    if (scrnWidth==414.0 || scrnWidth==375.0){
        NSLog(@"BIGPHONE");
        [self performSegueWithIdentifier:[resId stringByAppendingString:@"2"] sender:nil];
    }
    
    else {
        [self performSegueWithIdentifier:resId sender:nil];
        
    }
}


//Processes the answers at the end and saves them as well as initiates the segue
-(void)processAns{
    
    amtMod++;
    
    //Compile which answers correspond to which type
    answerTypes = [[NSMutableArray alloc] init];
    [answerTypes insertObject:@"CHEESE SANDWICH" atIndex:0];
    for (int i=1;i<answers.count;i++){
        if([[answers objectAtIndex:i] isEqual:@"A1"]){
            bartleQuestion *placeholderA1 = [questions objectAtIndex:i];
            [answerTypes insertObject:placeholderA1.ans1Type atIndex:i];
        }
        else if([[answers objectAtIndex:i] isEqual:@"A2"]){
            bartleQuestion *placeholderA2 = [questions objectAtIndex:i];
            [answerTypes insertObject:placeholderA2.ans2Type atIndex:i];
        }
    }
    
    
    //Compile How Many of each type
    for (int i=0;i<answers.count;i++) {
        
        if ([[answerTypes objectAtIndex:i] isEqual:@"e"]){
            exploreNum++;
        }
        
        else if ([[answerTypes objectAtIndex:i] isEqual:@"a"]){
            achieveNum++;
        }
        
        else if ([[answerTypes objectAtIndex:i] isEqual:@"s"]){
            socialNum++;
        }
        
        else if ([[answerTypes objectAtIndex:i] isEqual:@"k"]){
            killNum++;
        }
    }
    
    int biggestThingyNum = 0;
    NSString *biggestThingy = @"Hello";
    
    if(biggestThingyNum<exploreNum){
        biggestThingyNum=exploreNum;
        biggestThingy = @"E";
        
    }
    
    else if(biggestThingyNum==exploreNum){
        biggestThingy = [biggestThingy stringByAppendingString:@"E"];
    }
    
    
    if(biggestThingyNum<achieveNum){
        biggestThingyNum=achieveNum;
        biggestThingy = @"A";
        
    }
    
    else if(biggestThingyNum==achieveNum){
        biggestThingy = [biggestThingy stringByAppendingString:@"A"];
    }
    
    if(biggestThingyNum<socialNum){
        biggestThingyNum=socialNum;
        biggestThingy = @"S";
        
    }
    
    else if((biggestThingyNum==socialNum)&&([biggestThingy length]<2)){
        biggestThingy = [biggestThingy stringByAppendingString:@"S"];
    }
    
    if(biggestThingyNum<killNum){
        biggestThingyNum=killNum;
        biggestThingy = @"K";
        
    }
    
    else if(biggestThingyNum==killNum&&([biggestThingy length]<2)){
        biggestThingy = [biggestThingy stringByAppendingString:@"K"];
    }
    
    //NSLog(@"this bit wins %@",biggestThingy);
    
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if (stdDefaults){
        [stdDefaults setObject:[NSNumber numberWithInt:exploreNum] forKey:@"ExploreNum"];
        [stdDefaults synchronize];
        [stdDefaults setObject:[NSNumber numberWithInt:achieveNum] forKey:@"AchieveNum"];
        [stdDefaults synchronize];
        [stdDefaults setObject:[NSNumber numberWithInt:socialNum] forKey:@"SocialNum"];
        [stdDefaults synchronize];
        [stdDefaults setObject:[NSNumber numberWithInt:killNum] forKey:@"KillNum"];
        [stdDefaults synchronize];
        [stdDefaults setObject:biggestThingy forKey:@"Biggest Trait"];
        [stdDefaults synchronize];
    }
    qNum=1;
    exploreNum=0;
    achieveNum=0;
    socialNum=0;
    killNum=0;
    if ([biggestThingy isEqual:@"E"]){
        [self segueToResult:@"explorerSegue"];
    }
    if ([biggestThingy isEqual:@"A"]){
        [self segueToResult:@"acheiverSegue"];
    }
    if ([biggestThingy isEqual:@"S"]){
        [self segueToResult:@"socializerSegue"];
    }
    if ([biggestThingy isEqual:@"K"]){
        [self segueToResult:@"killerSegue"];
    }
    else {
        [self performSegueWithIdentifier:@"comboSegue" sender:nil];
    }
}


- (void)viewDidLoad
{
    //self.quizScrollingDescriptionLabel.selectable=NO;
    self.initialScrollingDescriptionLabel.selectable=NO;
    self.quizScrollingDescriptionLabel.text=@" ";
    self.initialScrollingDescriptionLabel.text=@" ";
    qNum=1;
    [self loadQuestions];
    [self prepQuestion];
    answers = [[NSMutableArray alloc] init];
    
    for (int i=0;i<[questions count];i++){
        [answers insertObject:@"NA" atIndex:i];
    }
    [self.showUnfinishedInfoButton setTitle:@"" forState:UIControlStateNormal];

    [self resetToDefault];
    
    
    [super viewDidLoad];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    
    [self resetToDefault];
    
    //Loading Result answers
    
    if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"E"]){
        self.mainTitleLabel.text = @"You're an Explorer";
        self.quizScrollingDescriptionLabel.text = @"Explorers love to learn and wander. In the game world, Explorers want to map the entire area and discover all of its hidden areas. In the classroom, Explorers love to amass large quantities of knowledge. Their sense of achievement comes from knowing more facts (often obscure ones) and finding secret shortcuts or mnemonics. Explorers are the closest to what we consider to be the ideal “academics”, who value knowledge for knowledge’s sake.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"ExploreIcon.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"A"]){
        self.mainTitleLabel.text = @"You're an Achiever";
        self.quizScrollingDescriptionLabel.text = @"Achievers love to gain levels, badges, and awards. In the game world, Achievers gain a sense of accomplishment by being the first to complete something, or by being one of the only ones to win a trophy or reward. They are often very motivated to “beat the game” and move on. In the classroom, Achievers are often most concerned with grades as a measure of their achievement. They are often detail-oriented and want to know the quickest, fastest, or shortest way to the prize.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"Achieve Icon.png"];
        [self setPercent];
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"S"]){
        self.mainTitleLabel.text = @"You're a Socializer";
        self.quizScrollingDescriptionLabel.text = @"Socializers are motivated by the desire to form meaningful connections and relationships with others. Socializers are often the connectors, who help to form questing parties and seem to know everyone online at any given moment. Socializers often form clans, which are groups of like-minded gamers, and when a particular game gets old, Socializers will simply switch games, keeping the clan intact. The game is simply a backdrop for the chatting and interactions that are the true draw. Socializers judge their accomplishments by how many friends, or how many followers they have.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"SocIcon.png"];
        [self setPercent];
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"K"]){
        self.mainTitleLabel.text = @"You're a Greifer";
        self.quizScrollingDescriptionLabel.text = @"In the online gaming world, Griefers willfully damage and vandalize other people’s creations. They take pleasure in the turmoil they cause in the game world, and in the damage they wreak on others. In the classroom, those students often are the first ones to see if they can hack the system, and are often willfully oblivious to the consequences to the community. However, Griefers are often great risk-takers, and are used to repeatedly starting over with nothing — because they’re always being killed — and who don’t mind being wrong. They are likely to have a growth mindset, rather than a fixed one, and if they can be drawn into the classroom community, they can have a positive influence on others.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"Kill.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"EA"]){
        self.mainTitleLabel.text = @"Explorer-Achiever";
        self.quizScrollingDescriptionLabel.text = @"You combine both characteristics of an Explorer and an Achiever. Explorers love to learn and wander. In the game world, Explorers want to map the entire area and discover all of its hidden areas. In the classroom, Explorers love to amass large quantities of knowledge. Their sense of achievement comes from knowing more facts (often obscure ones) and finding secret shortcuts or mnemonics. Explorers are the closest to what we consider to be the ideal “academics”, who value knowledge for knowledge’s sake. Achievers love to gain levels, badges, and awards. In the game world, Achievers gain a sense of accomplishment by being the first to complete something, or by being one of the only ones to win a trophy or reward. They are often very motivated to “beat the game” and move on. In the classroom, Achievers are often most concerned with grades as a measure of their achievement. They are often detail-oriented and want to know the quickest, fastest, or shortest way to the prize.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"ES"]){
        self.mainTitleLabel.text = @"Explorer-Socializer";
        self.quizScrollingDescriptionLabel.text = @"You combine both characteristics of an Explorer and a Socializer. Explorers love to learn and wander. In the game world, Explorers want to map the entire area and discover all of its hidden areas. In the classroom, Explorers love to amass large quantities of knowledge. Their sense of achievement comes from knowing more facts (often obscure ones) and finding secret shortcuts or mnemonics. Explorers are the closest to what we consider to be the ideal “academics”, who value knowledge for knowledge’s sake.Socializers are motivated by the desire to form meaningful connections and relationships with others. Socializers are often the connectors, who help to form questing parties and seem to know everyone online at any given moment. Socializers often form clans, which are groups of like-minded gamers, and when a particular game gets old, Socializers will simply switch games, keeping the clan intact. The game is simply a backdrop for the chatting and interactions that are the true draw. Socializers judge their accomplishments by how many friends, or how many followers they have.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"EK"]){
        self.mainTitleLabel.text = @"Explorer-Griefer";
        self.quizScrollingDescriptionLabel.text = @"You combine both characteristics of an Explorer and a Killer. Explorers love to learn and wander. In the game world, Explorers want to map the entire area and discover all of its hidden areas. In the classroom, Explorers love to amass large quantities of knowledge. Their sense of achievement comes from knowing more facts (often obscure ones) and finding secret shortcuts or mnemonics. Explorers are the closest to what we consider to be the ideal “academics”, who value knowledge for knowledge’s sake. In the online gaming world, Griefers willfully damage and vandalize other people’s creations. They take pleasure in the turmoil they cause in the game world, and in the damage they wreak on others. In the classroom, those students often are the first ones to see if they can hack the system, and are often willfully oblivious to the consequences to the community. However, Griefers are often great risk-takers, and are used to repeatedly starting over with nothing — because they’re always being killed — and who don’t mind being wrong. They are likely to have a growth mindset, rather than a fixed one, and if they can be drawn into the classroom community, they can have a positive influence on others.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"AS"]){
        self.mainTitleLabel.text = @"Achiever-Socializer";
        self.quizScrollingDescriptionLabel.text = @"You combine both characteristics of an Achiever and a Socializer. Achievers love to gain levels, badges, and awards. In the game world, Achievers gain a sense of accomplishment by being the first to complete something, or by being one of the only ones to win a trophy or reward. They are often very motivated to “beat the game” and move on. In the classroom, Achievers are often most concerned with grades as a measure of their achievement. They are often detail-oriented and want to know the quickest, fastest, or shortest way to the prize. Socializers are motivated by the desire to form meaningful connections and relationships with others. Socializers are often the connectors, who help to form questing parties and seem to know everyone online at any given moment. Socializers often form clans, which are groups of like-minded gamers, and when a particular game gets old, Socializers will simply switch games, keeping the clan intact. The game is simply a backdrop for the chatting and interactions that are the true draw. Socializers judge their accomplishments by how many friends, or how many followers they have.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"AK"]){
        self.mainTitleLabel.text = @"Achiever-Greifer";
        self.quizScrollingDescriptionLabel.text = @"You combine both characteristics of an Achiever and those of a Killer. Achievers love to gain levels, badges, and awards. In the game world, Achievers gain a sense of accomplishment by being the first to complete something, or by being one of the only ones to win a trophy or reward. They are often very motivated to “beat the game” and move on. In the classroom, Achievers are often most concerned with grades as a measure of their achievement. They are often detail-oriented and want to know the quickest, fastest, or shortest way to the prize. In the online gaming world, Griefers willfully damage and vandalize other people’s creations. They take pleasure in the turmoil they cause in the game world, and in the damage they wreak on others. In the classroom, those students often are the first ones to see if they can hack the system, and are often willfully oblivious to the consequences to the community. However, Griefers are often great risk-takers, and are used to repeatedly starting over with nothing — because they’re always being killed — and who don’t mind being wrong. They are likely to have a growth mindset, rather than a fixed one, and if they can be drawn into the classroom community, they can have a positive influence on others.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"SK"]){
        self.mainTitleLabel.text = @"Socializer-Greifer";
        self.quizScrollingDescriptionLabel.text = @"You combine both the characteristics of a Socializer and those of a Killer. Socializers are motivated by the desire to form meaningful connections and relationships with others. Socializers are often the connectors, who help to form questing parties and seem to know everyone online at any given moment. Socializers often form clans, which are groups of like-minded gamers, and when a particular game gets old, Socializers will simply switch games, keeping the clan intact. The game is simply a backdrop for the chatting and interactions that are the true draw. Socializers judge their accomplishments by how many friends, or how many followers they have. In the online gaming world, Griefers willfully damage and vandalize other people’s creations. They take pleasure in the turmoil they cause in the game world, and in the damage they wreak on others. In the classroom, those students often are the first ones to see if they can hack the system, and are often willfully oblivious to the consequences to the community. However, Griefers are often great risk-takers, and are used to repeatedly starting over with nothing — because they’re always being killed — and who don’t mind being wrong. They are likely to have a growth mindset, rather than a fixed one, and if they can be drawn into the classroom community, they can have a positive influence on others.";
        self.initialScrollingDescriptionLabel.text=@" ";
        [_startQuizLabel setTitle:@"Take the Test Again" forState:UIControlStateNormal];
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [self setPercent];
        
    }
    
    
    else{
        self.mainTitleLabel.text = @"The Bartle Test";
        self.quizScrollingDescriptionLabel.text=@" ";
        self.initialScrollingDescriptionLabel.text = @"The Bartle Test of Gamer Psychology is an online multiple choice test. The test is based on how students play games and only takes a few minutes. Students fall into one or more of four categories: Socializer, Achiever, Explorer, or Killer. I use these results to inform how I make groups and how I ask kids to collaborate. It offers useful insight into how students will react in different situations, and also provides a starting point for me at the beginning of the semester. Try it yourself, and see what insights it gives you into how best to engage your students.";
        self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
        [_startQuizLabel setTitle:@"Take the Test" forState:UIControlStateNormal];
        
        self.exPercentLabel.text = @" ";
        self.acPercentLabel.text = @" ";
        self.soPercentLabel.text = @" ";
        self.kiPercentLabel.text = @" ";
        
    }
    
    
    [self prepQuestion];
    [super viewWillAppear:YES];
}

//*Sorta deprecated* (._. ) it resets the changeable bartle test text and percentages
-(void)resetToDefault{
    self.mainTitleLabel.text = @"The Bartle Test";
    self.quizScrollingDescriptionLabel.text=@" ";
    self.initialScrollingDescriptionLabel.text = @"The Bartle Test of Gamer Psychology is an online multiple choice test. On one of the first days of class, I ask my students to take the Bartle Test online, and report their results to me on a Google Form. It takes about twenty minutes. Based on the students’ answers, it assigns a weight in four separate categories: Socializer, Achiever, Explorer, or Killer. Students will often be a mixture of more than one category, although most of the weight will usually be in one category. I use these results to inform how I make groups and how I ask kids to collaborate. The test is based on how students play games. It offers useful insight into how students will react in different situations, and also provides a starting point for me at the beginning of the semester. Try it yourself, and see what insights it gives you into how best to engage your students.";

    self.sideIcon.image = [UIImage imageNamed:@"blank.png"];
    [_startQuizLabel setTitle:@"Take the Test" forState:UIControlStateNormal];
    
    self.exPercentLabel.text = @" ";
    self.acPercentLabel.text = @" ";
    self.soPercentLabel.text = @" ";
    self.kiPercentLabel.text = @" ";

}

//Sets the percentages and bars on the stat page
-(void)setPercent
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    
    float totalQ = [[NSNumber numberWithFloat:[questions count]-1]floatValue]/2;
    
    float frac = [[stdDefaults objectForKey:@"ExploreNum"] floatValue]/totalQ;
    [self.exBar setProgress:frac animated:YES];
    float perc = frac*100+.5;
    int intPerc = perc;
    self.exPercentLabel.text = [[@"Explorer - " stringByAppendingString:[NSString stringWithFormat:@"%i",intPerc]] stringByAppendingString:@"%"];
    
    frac = [[stdDefaults objectForKey:@"AchieveNum"] floatValue]/totalQ;
    [self.acBar setProgress:frac animated:YES];
    perc = frac*100+.5;
    intPerc = perc;
    self.acPercentLabel.text = [[@"Achiever - " stringByAppendingString:[NSString stringWithFormat:@"%i",intPerc]] stringByAppendingString:@"%"];
    
    frac = [[stdDefaults objectForKey:@"SocialNum"] floatValue]/totalQ;
    [self.socBar setProgress:frac animated:YES];
    perc = frac*100+.5;
    intPerc = perc;
    self.soPercentLabel.text = [[@"Socializer - " stringByAppendingString:[NSString stringWithFormat:@"%i",intPerc]] stringByAppendingString:@"%"];
    
    frac = [[stdDefaults objectForKey:@"KillNum"] floatValue]/totalQ;
    [self.kiBar setProgress:frac animated:YES];
    perc = frac*100+.5;
    intPerc = perc;
    self.kiPercentLabel.text = [[@"Greifer - " stringByAppendingString:[NSString stringWithFormat:@"%i",intPerc]] stringByAppendingString:@"%"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startQuiz:(id)sender {
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if (stdDefaults){
        [stdDefaults setObject:0 forKey:@"ExploreNum"];
        [stdDefaults setObject:0 forKey:@"AchieveNum"];
        [stdDefaults setObject:0 forKey:@"SocialNum"];
        [stdDefaults setObject:0 forKey:@"KillNum"];
        [stdDefaults setObject:@"NA" forKey:@"Biggest Trait"];
        [stdDefaults synchronize];
    }
    qNum=1;
    [self prepQuestion];
}

- (IBAction)select1:(id)sender {
    if ([[answers objectAtIndex:qNum] isEqualToString:@"NA"]){
        notFinishedNum--;
    }
    
    [answers replaceObjectAtIndex:qNum withObject:@"A1"];
    
    //RGB of selected button is 223 229 244
    UIColor *selCol = [UIColor colorWithRed:(.95) green:(.95) blue:(1) alpha:(1)];
    UIColor *blnkCol = [UIColor colorWithRed:(.97) green:(.97) blue:(.97) alpha:(1)];
    
    self.select2Button.backgroundColor = blnkCol;
    self.select1Button.backgroundColor = selCol;
    
    [self UpdateUnfinishedQuestionLabel];

    
    //[self advance];
}

- (IBAction)select2:(id)sender {
    if ([[answers objectAtIndex:qNum] isEqualToString:@"NA"]){
        notFinishedNum--;
    }
    
    [answers replaceObjectAtIndex:qNum withObject:@"A2"];
    
    //RGB of selected button is 223 229 244
    UIColor *selCol = [UIColor colorWithRed:(.95) green:(.95) blue:(1) alpha:(1)];
    UIColor *blnkCol = [UIColor colorWithRed:(.97) green:(.97) blue:(.97) alpha:(1)];
    
    self.select2Button.backgroundColor = selCol;
    self.select1Button.backgroundColor = blnkCol;
    
    [self UpdateUnfinishedQuestionLabel];

    //[self advance];
    
}


//Go Forward
-(void)advance{
    if(qNum<[questions count]-1){
        qNum++;
        [self prepQuestion];
    }
    else if ([self finishedAll]==true) {
        [self processAns];
        
    }
    
    else {
        //int herp = [self finishedAll];
        [self outputUnfinishedAlert];
        unfinishedAndChecked=true;
        [self prepQuestion];
    }
}


- (IBAction)prev:(id)sender {
    if(qNum>1){
        qNum--;
        //This "flashes" the arrow
        NSString *backArrow = self.prevButton.titleLabel.text;
        [self.prevButton setTitle:@" " forState:UIControlStateSelected];
        [self.prevButton setTitle:backArrow forState:UIControlStateNormal];
    }
    [self prepQuestion];
}

- (IBAction)nex:(id)sender {
    NSString *nexArrow = self.nexButton.titleLabel.text;
    //This "flashes" the arrow
    [self.nexButton setTitle:@"ckd" forState:UIControlStateNormal];
    [self.nexButton setTitle:nexArrow forState:UIControlStateNormal];
    [self advance];
    
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)reload:(id)sender {
   
}
-(IBAction)pushToSafari
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.kiang.net/blog"]];
}

- (IBAction)backToHome:(id)sender {
}

- (IBAction)emailRes:(id)sender {
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    NSString *type;
    
    if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"E"]){
        type = @"an Explorer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"A"]){
        type = @"an Achiever";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"S"]){
        self.mainTitleLabel.text = @"a Socializer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"K"]){
        self.mainTitleLabel.text = @"a Greifer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"EA"]){
        self.mainTitleLabel.text = @"an Explorer-Achiever";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"ES"]){
        self.mainTitleLabel.text = @"an Explorer-Socializer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"EK"]){
        self.mainTitleLabel.text = @"an Explorer-Griefer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"AS"]){
        self.mainTitleLabel.text = @"an Achiever-Socializer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"AK"]){
        self.mainTitleLabel.text = @"an Achiever-Greifer";
    }
    
    else if ([[stdDefaults objectForKey:@"Biggest Trait"] isEqual:@"SK"]){
        self.mainTitleLabel.text = @"a Socializer-Greifer";
    }
    
    NSString *URLtemp = @"mailto:?subject=I%20am%20";
    NSString *urlSt = [URLtemp stringByAppendingString:[type stringByReplacingOccurrencesOfString:@"" withString:@"%20"]];
    NSURL *mailURL = [NSURL URLWithString:urlSt];
    [[UIApplication sharedApplication] openURL:mailURL];
}

- (IBAction)showUnfinishedInfo:(id)sender {
    if (unfinishedAndChecked){
        [self outputUnfinishedAlert];
    }
}



-(void)outputUnfinishedAlert{
    NSString *unfinishedAlertString = @"";
    for (int i=1;i<[answers count];i++){
        if ([[answers objectAtIndex:i] isEqualToString:@"NA"]){
            unfinishedAlertString=[NSString stringWithFormat:@"%@ #%@,",unfinishedAlertString,[@(i) stringValue]];
        }
    }
    UIAlertView *alertv = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%i question(s) still need to be answered.",notFinishedNum]
                                                     message:[@"The following questions are unanswered: \n" stringByAppendingString:unfinishedAlertString]
                                                    delegate:self
                                           cancelButtonTitle:@"Okay"
                                           otherButtonTitles:nil];
    [alertv show];
}
@end

