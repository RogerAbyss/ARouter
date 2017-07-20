//
//  ARouterRulePush.m
//  Pods
//
//  Created by Abyss on 2017/6/3.
//
//

#import "ARouterProtocolPush.h"

#import "UIViewController+ARouter.h"
#import "JSONKit.h"

static UINavigationController* default_router_nav = nil;

@implementation ARouterProtocolPush

+ (void)setGlobalNavController:(UINavigationController *)nav
{
    default_router_nav = nav;
}

- (NSString *)operation
{
    return @"push";
}

- (void)handle:(NSArray<NSURLQueryItem *> *)queryItems
{
    NSMutableArray* models = nil;
    UIViewController* target = nil;
    NSMutableDictionary* info = nil;
    
    for (NSURLQueryItem* item in queryItems)
    {
        if ([item.name isEqualToString:@"target"])
        {
            models = [NSMutableArray arrayWithArray:[item.value componentsSeparatedByString:@"*"]];
        }
        else
        {
            NSLog(@"%@ %@",item.name,item.value);
            if (!info)
            {
                info = [NSMutableDictionary dictionary];
            }
            
            if ([item.name isEqualToString:@"info"])
            {
                [info addEntriesFromDictionary:[item.value objectFromJSONString]];
            }
            else
            {
                [info setObject:item.value forKey:item.name];
            }
        }
    }
    
    if (models && models.count>0)
    {
        target = [NSClassFromString(models.lastObject) new];
        [models removeLastObject];
        
        NSMutableArray* list = nil;
        
        
        if (target)
        {
            if (!default_router_nav)
            {
                NSLog(@"use +(void)setGlobalNavController:");
                return;
            }
            
            if (models > 0)
            {
                list = [NSMutableArray arrayWithArray:default_router_nav.viewControllers];
                for (NSString* m in models)
                {
                    UIViewController* c = [NSClassFromString(m) new];
                    [list addObject:c];
                }
            }
            else
            {
                list = [NSMutableArray array];
            }

            [list addObject:target];
            NSLog(@"执行PUSH");
            
            if (info)
            {
                target.router_info = info;
            }
            
            default_router_nav.viewControllers = list;
        }
    }
}

@end
