//
//  CoreDataHelper.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 06.08.2021.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataManager.h"
#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isFavorite:(Ticket *)ticket;
- (NSArray *)favorites;
- (void)addToFavorite:(Ticket *)ticket;
- (void)removeFromFavorite:(Ticket *)ticket;

@end

NS_ASSUME_NONNULL_END
