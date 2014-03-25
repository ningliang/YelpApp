//
//  Business.h
//  Yelp
//
//  Created by Ning Liang on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) float rating;
@property (nonatomic, assign) NSInteger reviewCount;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *neighborhood;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *ratingImageUrl;
@property (nonatomic, strong) NSString *categories;

+ (Business *)businessWithDictionary:(NSDictionary *)dictionary;

@end
