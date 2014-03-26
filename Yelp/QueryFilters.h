//
//  QueryFilters.h
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryFilters : NSObject

// Search
@property (nonatomic, strong) NSString *term;

// Toggles
- (BOOL) toggleValue:(NSInteger) index;
- (NSString *) toggleName:(NSInteger) index;
- (NSString *) toggleParam:(NSInteger) index;
- (NSInteger) toggleCount;
- (void) setToggle:(NSInteger) index withValue:(BOOL) on;

// Sort order
@property (nonatomic, strong) NSString *sortOrder;
@property (nonatomic, strong) NSArray *sortOrders;

// Distance limit
@property (nonatomic, assign) float distance;
@property (nonatomic, assign) NSArray *distances;
@property (nonatomic, assign) NSArray *distanceNames;
- (NSString *) selectedDistanceName;

// Deep copy
- (QueryFilters *) clone;

// Search params
- (NSString *)categoryFilters;

@end
