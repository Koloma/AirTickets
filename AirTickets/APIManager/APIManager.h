//
//  APIManager.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 28.07.2021.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)cityForCurrentIP:(void (^)(City *city))completion;
- (void)ticketsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSArray *tickets))completion;

@end

NS_ASSUME_NONNULL_END