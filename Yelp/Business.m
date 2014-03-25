//
//  Business.m
//  Yelp
//
//  Created by Ning Liang on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "Business.h"

@implementation Business

+ (Business *)businessWithDictionary:(NSDictionary *)dictionary {
    Business *business = [[Business alloc] init];

    business.name = dictionary[@"name"];
    business.rating = [dictionary[@"rating"] floatValue];
    business.reviewCount = [dictionary[@"review_count"] integerValue];
    business.address = dictionary[@"location"][@"display_address"][0];
    business.neighborhood = dictionary[@"location"][@"display_address"][2];
    business.imageUrl = dictionary[@"image_url"];
    business.ratingImageUrl = dictionary[@"rating_img_url"];
    
    NSMutableArray *categoryStrings = [[NSMutableArray alloc] init];
    for (NSArray *tuple in dictionary[@"categories"]) {
        [categoryStrings addObject:tuple[0]];
    }
    business.categories = [categoryStrings componentsJoinedByString:@", "];

    return business;
}

@end
