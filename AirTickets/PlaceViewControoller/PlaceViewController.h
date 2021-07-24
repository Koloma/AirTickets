//
//  PlaceViewController.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 24.07.2021.
//

#import "ViewController.h"
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum PlaceType {
    PlaceTypeArrival,
    PlaceTypeDeparture
} PlaceType;

@protocol PalceViewControllerDelegate <NSObject>

-(void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;

@end


@interface PlaceViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<PalceViewControllerDelegate>delegate;
-(instancetype)initWithType:(PlaceType)type;

@end

NS_ASSUME_NONNULL_END
