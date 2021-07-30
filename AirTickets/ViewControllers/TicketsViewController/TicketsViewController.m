//
//  TicketsViewController.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 30.07.2021.
//

#import "TicketsViewController.h"
#import "Constants.h"

@interface TicketsViewController ()
@property (nonatomic, strong) NSArray *tickets;
@end

@implementation TicketsViewController

- (instancetype)initWithTickets:(NSArray *)tickets {
    self = [super init];
    if (self)
    {
        _tickets = tickets;
        self.title = titleTikets;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
