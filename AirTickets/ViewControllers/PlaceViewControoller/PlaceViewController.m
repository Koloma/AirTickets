//
//  PlaceViewController.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 24.07.2021.
//

#import "PlaceViewController.h"
#import "PlaceViewBuilder.h"
#import "Constants.h"
#import "PlaceTableViewCell.h"


@interface PlaceViewController ()

@property (nonatomic) PlaceType placeType;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *currentArray;
@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation PlaceViewController

-(instancetype)initWithType:(PlaceType)type {
    self = [super init];
    if (self) {
        _placeType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.obscuresBackgroundDuringPresentation = NO;
    _searchController.searchResultsUpdater = self;
    _searchArray = [NSArray new];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _searchController.searchBar;
    [self.view addSubview: _tableView];
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[titleCities, titleAirports]];
    [_segmentedControl addTarget:self action:@selector(changeSource) forControlEvents:UIControlEventValueChanged];
    _segmentedControl.tintColor = [UIColor blackColor];
    self.navigationItem.titleView = _segmentedControl;
    _segmentedControl.selectedSegmentIndex = 0;
    [self changeSource];
    
    if (_placeType == PlaceTypeDeparture) {
        self.title = titleDeparture;
    }
    else {
        self.title = titleArrival;
    }
    
}

-(void) changeSource {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _currentArray = [[DataManager sharedInstance] cities];
            break;
        case 1:
            _currentArray = [[DataManager sharedInstance] airports];
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    PlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: reuseIdentifierCell];
    
    DataViewModel dataViewModel;

    if (_segmentedControl.selectedSegmentIndex == 0) {
        City *city = (_searchController.isActive && [_searchArray count] > 0) ? [_searchArray objectAtIndex:indexPath.row] : [_currentArray objectAtIndex:indexPath.row];
        dataViewModel.name = city.name;
        dataViewModel.code = city.code;
        dataViewModel.image = [UIImage systemImageNamed:@"airplane"];
         
    }
    else {
        Airport *airport = (_searchController.isActive && [_searchArray count] > 0) ? [_searchArray objectAtIndex:indexPath.row] : [_currentArray objectAtIndex:indexPath.row];
        dataViewModel.name = airport.name;
        dataViewModel.code = airport.code;
        dataViewModel.image = [UIImage systemImageNamed:@"building.2.crop.circle"];
    }
    
    if (!cell) {
        cell = [[PlaceTableViewCell alloc] initWithDataViewModel:dataViewModel reuseIdentifier:reuseIdentifierCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else{
        [cell configCell:dataViewModel];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_currentArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataSourceType dataType = ((int)_segmentedControl.selectedSegmentIndex) + 1;
    if (_searchController.isActive && [_searchArray count] > 0) {
        [self.delegate selectPlace:[_searchArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
        _searchController.active = NO;
    } else {
        [self.delegate selectPlace:[_currentArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", searchController.searchBar.text];
        _searchArray = [_currentArray filteredArrayUsingPredicate: predicate];
        [_tableView reloadData];
    }
}

@end
