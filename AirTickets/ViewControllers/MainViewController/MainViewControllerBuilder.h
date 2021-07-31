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

+ (UIButton *)buildGetCityByIPButton:(NSString *)title;
+ (UIButton *)buildGetCityByGPSButton:(NSString *)title;
+ (UIButton *)buildDepartureButton:(NSString *)title;
+ (UIButton *)buildArrivalButton:(NSString *)title departureButton:(UIButton *)departureButton;
+ (UIButton *)buildSearchButton:(NSString *)title arrivalButton:(UIButton *)arrivalButton;
+ (UIButton *)buildMapButton:(NSString *)title searchButton:(UIButton *)searchButton;

@end

NS_ASSUME_NONNULL_END
