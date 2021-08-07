//
//  TicketTableViewCell.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 07.08.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "APIManager.h"
#import "Ticket.h"
#import "FavoriteTicket+CoreDataClass.h"

#define ticketCellReuseIdentifier @"TicketCellIdentifier"

NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell
@property (nonatomic, strong) Ticket *ticket;
@property (nonatomic, strong) FavoriteTicket *favoriteTicket;
@end

NS_ASSUME_NONNULL_END
