//
//  PlaceTableViewCell.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 27.07.2021.
//

#import "PlaceTableViewCell.h"


@interface PlaceTableViewCell()

@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *codeLable;
@property (nonatomic, strong) UIImageView *cellImageView;

@end

@implementation PlaceTableViewCell

- (instancetype) initWithDataViewModel: (DataViewModel)dataViewModel reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
        _nameLable.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_nameLable];
        
        _codeLable = [[UILabel alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
        _codeLable.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_codeLable];
        
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
       
        [self configCell:dataViewModel];
    }
    return self;
    
}

- (void)configCell: (DataViewModel)dataViewModel {
    _nameLable.text = dataViewModel.name;
    _codeLable.text = dataViewModel.code;
    _cellImageView.image = dataViewModel.image;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _codeLable.text = nil;
    _nameLable.text = nil;
    _cellImageView.image = nil;
}

@end
