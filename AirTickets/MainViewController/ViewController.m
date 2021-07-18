//
//  ViewController.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 18.07.2021.
//

#import "ViewController.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager shared] loadData];
    self.view.backgroundColor = UIColor.magentaColor;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidComplete) name:kDataManagerLoadDataDidComplete object:nil];
}


- (void) loadDidComplete {
    [self addLableLoadDidComplete];
//    for (City *city in [[DataManager shared] cities]) {
//        NSLog(@"%@", city);
//    }

//    for (Airport *airport in [[DataManager shared] airports]) {
//        NSLog(@"%@", airport);
//    }
 
    for (Country *country in [[DataManager shared] countries]) {
        NSLog(@"%@", country);
    }
    
    
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) addLableLoadDidComplete {
    
    CGFloat lableWidth = [UIScreen mainScreen].bounds.size.width - 50;
    CGFloat lableHeight = 40.0;
    CGFloat lableXPosition = ([UIScreen mainScreen].bounds.size.width / 2) - lableWidth / 2;
    CGFloat lableYPosition = [UIScreen mainScreen].bounds.size.height / 2;
    
    CGRect labelFrame = CGRectMake(lableXPosition, lableYPosition, lableWidth , lableHeight);
    UILabel *label = [[UILabel alloc] initWithFrame: labelFrame];

    label.text = @"Load Data Complete";
    label.textColor = UIColor.systemOrangeColor;
    label.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightBold];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview: label];
}

@end
