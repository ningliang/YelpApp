//
//  QueryFilters.m
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "QueryFilters.h"

@interface QueryFilters ()

@property (nonatomic, strong) NSMutableArray *toggleValues;
@property (nonatomic, strong) NSArray *toggleNames;
@property (nonatomic, strong) NSArray *toggleParams;

@end

@implementation QueryFilters

-(id)init {
    if (self = [super init])  {
        self.toggleNames = @[@"Cuban", @"Delis", @"Diners", @"French",
                             @"Gastropubs", @"Halal", @"Hot Pot", @"Pizza"];
        self.toggleParams = @[@"cuban", @"delis", @"diners", @"french",
                              @"gastropubs", @"halal", @"hotpot", @"pizza"];
        self.toggleValues = [@[@(NO), @(NO), @(NO), @(NO), @(NO), @(NO), @(NO), @(NO)] mutableCopy];
        
        self.distances = @[@(0.0), @(400), @(1000), @(1609.34), @(8046.72)];
        self.distanceNames = @[@"Auto", @"2 blocks", @"5 blocks", @"1 mile", @"5 miles"];
        self.distance = [self.distances[0] floatValue];
        
        self.sortOrders = @[@"Best Match", @"Distance", @"Rating"];
        self.sortOrder = self.sortOrders[0];

        self.term = @"";
    }
    return self;
}

- (BOOL) toggleValue:(NSInteger) index {
    return [self.toggleValues[index] boolValue];
}

- (NSString *) toggleName:(NSInteger) index {
    return self.toggleNames[index];
}

- (NSString *) toggleParam:(NSInteger) index {
    return [self.toggleParams[index] stringValue];
}

- (NSInteger) toggleCount {
    return [self.toggleValues count];
}

- (void) setToggle:(NSInteger)index withValue:(BOOL) on {
    self.toggleValues[index] = @(on);
}

- (QueryFilters *) clone {
    QueryFilters *copy = [[QueryFilters alloc] init];

    NSUInteger index = 0;
    for (id toggleValue in self.toggleValues) {
        BOOL on = [toggleValue boolValue];
        [copy setToggle:index withValue:on];
        index += 1;
    }
    
    copy.distance = self.distance;
    copy.sortOrder = self.sortOrder;

    return copy;
}

- (NSString *)categoryFilters {
    NSMutableArray *onValues = [[NSMutableArray alloc] init];
    
    NSInteger index = 0;
    for (id value in self.toggleValues) {
        if ([value boolValue]) {
            [onValues addObject:self.toggleParams[index]];
        }
        index += 1;
    }
    return [onValues componentsJoinedByString:@", "];
}

- (NSString *) selectedDistanceName {
    if (self.distance == 0.0) {
        return self.distanceNames[0];
    } else if (self.distance == 0.1) {
        return self.distanceNames[1];
    } else if (self.distance == 0.25) {
        return self.distanceNames[2];
    } else if (self.distance == 1) {
        return self.distanceNames[3];
    } else {
        return self.distanceNames[4];
    }
}

- (NSInteger) sortParameter {
    NSInteger param = 0;
    NSInteger index = 0;
    for (NSString *string in self.sortOrders) {
        if ([string isEqualToString:self.sortOrder]) {
            param = index;
        }
        index += 1;
    }
    return param;
}

@end
