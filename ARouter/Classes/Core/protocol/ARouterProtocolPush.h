//
//  ARouterRulePush.h
//  Pods
//
//  Created by Abyss on 2017/6/3.
//
//

#import <Foundation/Foundation.h>
#import "ARouterProtocol.h"

/**
 *  [scheme]://push?target=[target*taget*...]&info=[param]&[param]
 */
@interface ARouterProtocolPush : ARouterProtocol

/**
 支持多级跳转
 (*分割)target1*taget2*...
 
 只有last.target才能接受参数,其他是隐式跳转
 有需求请使用ARouterProtocalChain
 */
@property (nonatomic, copy) NSString* target;
@property (nonatomic, strong) NSDictionary* info;


@end
