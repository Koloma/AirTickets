//
//  Country.m
//  AirTickets
//
//  Created by Alexander Kolomenskiy on 18.07.2021.
//

#import "Country.h"

@implementation Country

- (instancetype) initWithDictionary: (NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.currency = [dictionary valueForKey:@"currency"];
        _translations = [dictionary valueForKey:@"name_translations"];
        _name = [dictionary valueForKey:@"name"];
        _code = [dictionary valueForKey:@"code"];
     }
    return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ [%@]", _name, _code];
}

@end
