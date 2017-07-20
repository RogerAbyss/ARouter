//
//  UIViewController+ARouter.m
//  XilianApp
//
//  Created by Abyss on 2017/5/23.
//  Copyright © 2017年 Chongqing Xilian Technology Dev. All rights reserved.
//

#import "UIViewController+ARouter.h"
#import <objc/runtime.h>

@implementation UIViewController (ARouter)

- (NSDictionary *)router_info
{
    return objc_getAssociatedObject(self, @selector(router_info));
}

- (void)setRouter_info:(NSDictionary *)router_info
{
    objc_setAssociatedObject(self, @selector(router_info), router_info, OBJC_ASSOCIATION_RETAIN);
}

+ (void)load
{
    Method origin = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method custom = class_getInstanceMethod([self class], @selector(custom_viewDidLoad));
    method_exchangeImplementations(origin, custom);
}


- (void)setupDefualtParams
{
    if (self.router_info && [self.router_info isKindOfClass:[NSDictionary class]]){
        for (NSString* key in self.router_info.allKeys){
            if ([self respondsToSelector:NSSelectorFromString(key)]){
                [self setValue:self.router_info[key] forKey:key];
            }
        }
    }
}

- (void)custom_viewDidLoad
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if([self respondsToSelector:@selector(setupDefualtParams)])
    {
        [self performSelector:@selector(setupDefualtParams)];
    }
#pragma clang diagnostic pop
    
    [self custom_viewDidLoad];
}

@end
