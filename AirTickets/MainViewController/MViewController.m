//
//  MViewController.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 26.07.2021.
//

#import "MViewController.h"
#import "Constants.h"

@interface MViewController ()
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchRequest;
@end

@implementation MViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager sharedInstance] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidComplete) name:kDataManagerLoadDataDidComplete object:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = titleNavigationController;
    
    _departureButton = [MainViewControllerBuilder builDepartureButton:titleDeparture];
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_departureButton];
    
    _arrivalButton = [MainViewControllerBuilder builArrivalButton:titleArrival departureButton:_departureButton];
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_arrivalButton];
    
}


- (void) loadDidComplete {
    //[self addLableLoadDidComplete];

    NSLog(@"loadDidComplete");
}


- (void)placeButtonDidTap:(UIButton *)sender {
    PlaceViewController *placeViewController;
    if ([sender isEqual:_departureButton]) {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeDeparture];
    } else {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController: placeViewController animated:YES];
}


- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {
    
    NSString *title;
    NSString *iata;
    
    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        iata = city.code;
    }
    else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        iata = airport.cityCode;
    }
    
    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = iata;
    } else {
        _searchRequest.destionation = iata;
    }
    
    [button setTitle:title forState:UIControlStateNormal];
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

- (void)selectPlace:(nonnull id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton: (placeType == PlaceTypeDeparture) ? _departureButton : _arrivalButton ];
}


@end
