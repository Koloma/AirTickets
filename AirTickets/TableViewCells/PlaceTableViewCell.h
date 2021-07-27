//
//  PlaceTableViewCell.h
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 27.07.2021.
//

#import <UIKit/UIKit.h>
#import "DataViewModel.h"
#define reuseIdentifierCell @"CellPlace"

NS_ASSUME_NONNULL_BEGIN



@interface PlaceTableViewCell : UITableViewCell

- (instancetype) initWithDataViewModel: (DataViewModel)dataViewModel reuseIdentifier:(NSString *)reuseIdentifier;
- (void)configCell: (DataViewModel)dataViewModel;

@end

NS_ASSUME_NONNULL_END
