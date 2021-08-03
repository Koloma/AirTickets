//
//  PlaceViewController.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 24.07.2021.
//

#import "MViewController.h"
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum PlaceType {
    PlaceTypeArrival,
    PlaceTypeDeparture
} PlaceType;

@protocol PlaceViewControllerDelegate <NSObject>

-(void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;

@end

@interface PlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@property (nonatomic, strong) id<PlaceViewControllerDelegate>delegate;
-(instancetype)initWithType:(PlaceType)type;

@end

NS_ASSUME_NONNULL_END
