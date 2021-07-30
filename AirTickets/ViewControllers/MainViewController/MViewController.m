//
//  MViewController.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 26.07.2021.
//

#import "MViewController.h"
#import "Constants.h"
#import "APIManager.h"
#import "TicketsViewController.h"
#import "Ticket.h"

@interface MViewController ()

@property (nonatomic, strong) UIButton *cityByIPButton;
@property (nonatomic, strong) UIButton *cityByGPSButton;
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic, strong) UIButton *searchButton;
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

    _cityByIPButton = [MainViewControllerBuilder buildGetCityByIPButton:@"Place by IP"];
    [_cityByIPButton addTarget:self action:@selector(placeByIPDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cityByIPButton];
    
    _cityByGPSButton = [MainViewControllerBuilder buildGetCityByGPSButton:@"Place by GPS"];
    [_cityByGPSButton addTarget:self action:@selector(placeByGPSDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cityByGPSButton];
    
    _departureButton = [MainViewControllerBuilder buildDepartureButton:titleDeparture];
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_departureButton];
    
    _arrivalButton = [MainViewControllerBuilder buildArrivalButton:titleArrival departureButton:_departureButton];
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_arrivalButton];
    
    _searchButton = [MainViewControllerBuilder buildSearchButton:titleSearch arrivalButton:_arrivalButton];
    [_searchButton addTarget:self action:@selector(searchButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
}


- (void) loadDidComplete {
    NSLog(@"loadDidComplete");
}


- (void)placeByIPDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] cityForCurrentIP:^(City *city) {
        [self setPlace:city withDataType:DataSourceTypeCity andPlaceType:PlaceTypeDeparture forButton:self->_departureButton];
    }];
}

- (void)placeByGPSDidTap:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"GPS not yet implemented" preferredStyle: UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Закрыть" style:(UIAlertActionStyleDefault) handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
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

- (void)searchButtonDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] ticketsWithRequest:_searchRequest withCompletion:^(NSArray *tickets) {
        if (tickets.count > 0) {
            TicketsViewController *ticketsViewController = [[TicketsViewController alloc] initWithTickets:tickets];
            [self.navigationController showViewController:ticketsViewController sender:self];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Увы!" message:@"По данному направлению билетов не найдено" preferredStyle: UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Закрыть" style:(UIAlertActionStyleDefault) handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
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
