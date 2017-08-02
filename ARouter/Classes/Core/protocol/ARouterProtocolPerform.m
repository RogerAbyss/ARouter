//
//  ARouterProtocolPerform.m
//  Pods
//
//  Created by abyss on 2017/8/2.
//
//

#import "ARouterProtocolPerform.h"

@implementation ARouterProtocolPerform

- (NSString *)operation
{
    return @"perform";
}

- (void)handle:(NSArray<NSURLQueryItem *> *)queryItems
{
    Class target = nil;
    SEL method = nil;
    NSMutableArray* list = [NSMutableArray array];
    
    for (NSURLQueryItem* item in queryItems)
    {
        if ([item.name isEqualToString:@"target"])
        {
            target = NSClassFromString(item.value);
            
            if (!target) return;
        }
        else if ([item.name isEqualToString:@"method"])
        {
            [list addObject:item.value];
        }
    }
    
    
    for (NSString* methodString in list) {
        method = NSSelectorFromString(methodString);
        
        if ([((NSObject *)target) respondsToSelector:method]) {
            [((NSObject *)target) performSelector:method withObject:nil afterDelay:0];
        }
    }
}

@end
