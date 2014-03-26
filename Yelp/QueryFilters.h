//
//  QueryFilters.h
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryFilters : NSObject

// Toggles
- (BOOL) toggleValue:(NSInteger) index;
- (NSString *) toggleName:(NSInteger) index;
- (NSString *) toggleParam:(NSInteger) index;
- (NSInteger) toggleCount;
- (void) setToggle:(NSInteger) index withValue:(BOOL) on;

// Sort order
@property (nonatomic, strong) NSString *sortOrder;

// Distance limit
@property (nonatomic, assign) float radiusLimit;

// Deep copy
- (QueryFilters *) clone;

@end
