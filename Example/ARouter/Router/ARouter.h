//
//  ARouter.h
//  XilianApp
//
//  Created by Abyss on 2017/5/23.
//  Copyright © 2017年 Chongqing Xilian Technology Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 If you want to use Router,
 In controler add :
 
 ARouter_NEED
 需要路由
 */

@class ARouterProtocol;
NS_ASSUME_NONNULL_BEGIN

@interface ARouter : NSObject

@property (nonatomic, strong) NSString* scheme;

+ (instancetype)global;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (void)addRule:(ARouterProtocol *)rule;

/** handle
 此方法不能实现App跳转
 */
+ (BOOL)handle:(NSURL *)url;

/** handle
 通过系统的url方法处理
 走系统的总感觉有问题,多个handle出现卡顿
 最好使用自带的Router,解析不出属于自己的scheme不会进行处理,再转交给系统
 
 系统的可用于App互相跳转
 */
- (BOOL)handle:(UIApplication *)app url:(NSURL *)url option:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)option;

@end

NS_ASSUME_NONNULL_END
