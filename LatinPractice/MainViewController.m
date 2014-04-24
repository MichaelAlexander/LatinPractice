//
//  MainViewController.m
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import "MainViewController.h"
#import "CardViewController.h"
#import "Deck.h"

@interface MainViewController ()

@property (nonatomic, strong) UIScrollView *deckView;
@property (nonatomic, assign) int page;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSMutableArray *views;

- (IBAction)showInfo:(id)sender;
- (void)loadDeckView;

@end

@implementation MainViewController

@synthesize deckView, page, deck, views;

- (id)initWithDeck:(Deck *)newDeck
{
    self = [super init];
    
    if (self) {
        deck = newDeck;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!views) {
        views = [[NSMutableArray alloc] init];
    }else{
        [views removeAllObjects];
    }
    
    for (int i = 0; i < [[deck deck] count]; i++ ) {
        [views addObject:[NSNull null]];
    }
    
    [self loadDeckView];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
        }
        if(result.height == 568) {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background568.png"]]];
        }
    }
    
    page = 0;
    
    
}

- (void)shuffleDeckWithGroup:(NSString *)group{
    [self.deckView removeFromSuperview];
    [deck loadDeckWithGroup:group];
    [self viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil deck:deck];
    //controller.context = managedObjectContext;
    controller.mainViewDelegate = self;
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)loadDeckView
{
    deckView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 438)];
    
    [deckView setBackgroundColor:[UIColor clearColor]];
    [deckView setPagingEnabled:TRUE];
    [deckView setDelegate:self];
    [deckView setContentSize:CGSizeMake(deckView.frame.size.width *[[deck deck] count], deckView.frame.size.width)];
    deckView.showsHorizontalScrollIndicator = NO;
    deckView.showsVerticalScrollIndicator = NO;
    deckView.scrollsToTop = NO;
    [self.view addSubview:deckView];
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

#pragma mark -
#pragma mark scrollview methods

-(IBAction)changePage:(id)sender
{
	[self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    CGRect frame = deckView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [deckView scrollRectToVisible:frame animated:YES];
}

- (void)loadScrollViewWithPage:(int)localPage
{
    if (localPage < 0)
        return;
    if (localPage >= [[deck deck] count])
        return;
    
    //NSNumber *pageHolder = [NSNumber numberWithInt:page];
    // replace the placeholder if necessary
    CardViewController *controller = [views objectAtIndex:localPage];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[CardViewController alloc] initWithCard:[[deck deck] objectAtIndex:localPage]];
        [views replaceObjectAtIndex:localPage withObject:controller];
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = deckView.frame;
        frame.origin.x = frame.size.width * localPage;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [deckView addSubview:controller.view];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = deckView.frame.size.width;
    page = floor((deckView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}


@end
