//
//  MainViewControllerBuilder.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 26.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewControllerBuilder : NSObject

+ (UIButton *)builDepartureButton:(NSString *)title;
+ (UIButton *)builArrivalButton:(NSString *)title departureButton:(UIButton *)departureButton;

@end

NS_ASSUME_NONNULL_END
