//
//  ARouterRulePush.m
//  Pods
//
//  Created by Abyss on 2017/6/3.
//
//

#import "ARouterProtocolPush.h"
#import "ARouter.h"

#import "UIViewController+ARouter.h"
#import "JSONKit.h"

static UINavigationController* default_router_nav = nil;

@implementation ARouterProtocolPush

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
            if (![ARouter global].nav)
            {
                NSLog(@"[ARouter]:please set globalNav");
                return;
            }
            
            if (models > 0)
            {
                list = [NSMutableArray arrayWithArray:[ARouter global].nav.viewControllers];
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
            
            [ARouter global].nav.viewControllers = list;
        }
    }
}

@end
