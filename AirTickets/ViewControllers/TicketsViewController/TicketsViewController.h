//
//  TicketsViewController.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 30.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController
- (instancetype)initWithTickets:(NSArray *)tickets;
- (instancetype)initFavoriteTicketsController;
@end

NS_ASSUME_NONNULL_END
