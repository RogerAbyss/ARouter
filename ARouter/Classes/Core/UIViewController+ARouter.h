//
//  UIViewController+ARouter.h
//  XilianApp
//
//  Created by Abyss on 2017/5/23.
//  Copyright © 2017年 Chongqing Xilian Technology Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 直接在UIViewController上添加支持,强侵略性,慎用
 这样的好处在于支持控制全局跳转
 内部为runtime动态方法,性能影响不大
 */
@interface UIViewController (ARouter)
@property (nonatomic, strong) NSDictionary *router_info;
@end

NS_ASSUME_NONNULL_END
