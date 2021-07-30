//
//  MainViewControllerBuilder.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 26.07.2021.
//

#import "MainViewControllerBuilder.h"

@implementation MainViewControllerBuilder

#define buttonHeight 60.0
#define leftPad  30.0



+ (UIButton *)buildGetCityByIPButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    
    button.frame = CGRectMake(leftPad, 140.0, [UIScreen mainScreen].bounds.size.width / 2 - leftPad*2, buttonHeight);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}

+ (UIButton *)buildGetCityByGPSButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 + leftPad, 140.0, [UIScreen mainScreen].bounds.size.width / 2 - 60.0, buttonHeight);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}

+ (UIButton *)buildDepartureButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    
    button.frame = CGRectMake(leftPad, 220.0, [UIScreen mainScreen].bounds.size.width - 60.0, buttonHeight);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}

+ (UIButton *)buildArrivalButton:(NSString *)title departureButton:(UIButton *)departureButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle: title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    button.frame = CGRectMake(leftPad, CGRectGetMaxY(departureButton.frame) + 20.0, [UIScreen mainScreen].bounds.size.width - 60.0, buttonHeight);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}

+ (UIButton *)buildSearchButton:(NSString *)title arrivalButton:(UIButton *)arrivalButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle: title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    button.frame = CGRectMake(leftPad, CGRectGetMaxY(arrivalButton.frame) + 30, [UIScreen mainScreen].bounds.size.width - 60.0, buttonHeight);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    button.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    return button;
}

@end
