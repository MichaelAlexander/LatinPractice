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

@end

@implementation MainViewController
@synthesize deckView, page, deck, managedObjectContext, views;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!deck) {
        deck = [[Deck alloc] initWithRoot:managedObjectContext];
    }
    
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
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.context = managedObjectContext;
    controller.mainViewDelegate = self;
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)loadDeckView
{
    deckView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    
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
    
	// update the scroll view to the appropriate page
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
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
   
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = deckView.frame.size.width;
    page = floor((deckView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}


@end
