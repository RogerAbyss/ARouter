//
//  CRRouterRule.m
//  Pods
//
//  Created by Abyss on 2017/6/3.
//
//

#import "CRRouterProtocol.h"

@implementation CRRouterProtocol

- (NSString *)operation
{
    return @"SET NAME FOR ME";
}

- (void)handle:(NSArray<NSURLQueryItem *> *)queryItems
{
    NSLog(@"SET HANDLE FOR ME");
}

@end
