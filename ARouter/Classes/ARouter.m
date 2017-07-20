//
//  ARouter.m
//  XilianApp
//
//  Created by Abyss on 2017/5/23.
//  Copyright © 2017年 Chongqing Xilian Technology Dev. All rights reserved.
//

#import "ARouter.h"
#import "ARouterProtocol.h"

#import "ARouterProtocolPush.h"

@interface ARouter ()
@property (nonatomic, strong) NSMutableSet* rules;
@end
@implementation ARouter

static ARouter *defaultRouter = nil;

+ (BOOL)selfChecking
{
    NSString* a1 = @"\n======================================\n ARouter \n======================================\n";
    
    NSString* a2 = @"\n 自检完成..\n";
    
    NSLog(@"%@%@",a1,a2);
    if ([[ARouter global].scheme isEqualToString:@"test"]) NSLog(@"\n[ARouter]Warning:我们发现scheme为默认的test!\n");
    
    NSLog(@"\n 从UIViewController动态增加了属性和方法:\n@selector(router_info)\n@selector(setupDefualtParams)\n@selector(custom_viewDidLoad)\n\n======================================\n ARouter \n======================================\n");
    
    
    return YES;
}

+ (instancetype)global
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultRouter = [[ARouter alloc] initWithDefualtSetting];
        
        [defaultRouter addRule:[ARouterProtocolPush new]];
        defaultRouter.scheme = @"test";
    });
    
    return defaultRouter;
}

- (instancetype)initWithDefualtSetting
{
    self = [super init];
    if (self) {
        _rules = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addRule:(ARouterProtocol *)rule
{
    [_rules addObject:rule];
}

- (BOOL)handle:(UIApplication *)app url:(NSURL *)url option:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)option
{
    return ![ARouter handle:url.absoluteString];
}

+ (BOOL)handle:(NSString *)url
{
    NSURLComponents* components = [NSURLComponents componentsWithString:url];
    
    if ([components.scheme isEqualToString:[ARouter global].scheme])
    {
        NSString* operation = components.host;
        
        for (ARouterProtocol* rule in [ARouter global].rules)
        {
            if ([rule.operation isEqualToString:operation])
            {
                [rule handle:components.queryItems];
            }
        }
        
        return YES;
    }
    
    return NO;
}

@end
