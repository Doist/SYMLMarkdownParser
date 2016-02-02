//
//  TestAttributesCollection.m
//  Markdown Parser Example
//
//  Created by Harry Jordan on 02/02/2016.
//  Copyright © 2016 Harry Jordan. All rights reserved.
//

#import "TestAttributesCollection.h"


NSString * const TestElementKey = @"element";


@implementation TestAttributesCollection


- (NSDictionary *)headingAttributes {
	return @{ TestElementKey : @"heading" };
}


- (NSDictionary *)horizontalRuleAttributes {
	return @{ TestElementKey : @"horizontalRuleAttributes" };
}

- (NSDictionary *)blockquoteAttributes {
	return @{ TestElementKey : @"blockquoteAttributes" };
}

- (NSDictionary *)listElementAttributes {
	return @{ TestElementKey : @"listElementAttributes" };
}

- (NSDictionary *)listLineAttributes {
	return @{ TestElementKey : @"listLineAttributes" };
}

- (NSDictionary *)emphasisAttributes {
	return @{ TestElementKey : @"emphasisAttributes" };
}

- (NSDictionary *)strongAttributes {
	return @{ TestElementKey : @"strongAttributes" };
}

- (NSDictionary *)linkAttributes {
	return @{ TestElementKey : @"linkAttributes" };
}

- (NSDictionary *)linkTitleAttributes {
	return @{ TestElementKey : @"linkTitleAttributes" };
}

- (NSDictionary *)linkTagAttributes {
	return @{ TestElementKey : @"linkTagAttributes" };
}

- (NSDictionary *)invalidLinkAttributes {
	return @{ TestElementKey : @"invalidLinkAttributes" };
}

- (NSDictionary *)urlAttributes {
	return @{ TestElementKey : @"urlAttributes" };
}

@end
