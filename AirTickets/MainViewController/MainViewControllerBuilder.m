//
//  MainViewControllerBuilder.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 26.07.2021.
//

#import "MainViewControllerBuilder.h"

@implementation MainViewControllerBuilder

+ (UIButton *)builDepartureButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    button.frame = CGRectMake(30.0, 140.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}

+ (UIButton *)builArrivalButton:(NSString *)title departureButton:(UIButton *)departureButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Куда" forState: UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    button.frame = CGRectMake(30.0, CGRectGetMaxY(departureButton.frame) + 20.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    button.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    return button;
}


@end
