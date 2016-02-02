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
	return @{ TestElementKey : @"horizontalRule" };
}

- (NSDictionary *)blockquoteAttributes {
	return @{ TestElementKey : @"blockquote" };
}

- (NSDictionary *)listElementAttributes {
	return @{ TestElementKey : @"listElement" };
}

- (NSDictionary *)listLineAttributes {
	return @{ TestElementKey : @"listLine" };
}

- (NSDictionary *)emphasisAttributes {
	return @{ TestElementKey : @"emphasis" };
}

- (NSDictionary *)strongAttributes {
	return @{ TestElementKey : @"strong" };
}

- (NSDictionary *)inlineCodeAttributes {
	return @{ TestElementKey : @"inlineCode" };
}

- (NSDictionary *)linkAttributes {
	return @{ TestElementKey : @"link" };
}

- (NSDictionary *)linkTitleAttributes {
	return @{ TestElementKey : @"linkTitle" };
}

- (NSDictionary *)linkTagAttributes {
	return @{ TestElementKey : @"linkTag" };
}

- (NSDictionary *)invalidLinkAttributes {
	return @{ TestElementKey : @"invalidLink" };
}

- (NSDictionary *)urlAttributes {
	return @{ TestElementKey : @"url" };
}

@end
