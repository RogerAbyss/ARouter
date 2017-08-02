//
//  ARouterProtocolPerform.h
//  Pods
//
//  Created by abyss on 2017/8/2.
//
//

#import <Foundation/Foundation.h>
#import "ARouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  [scheme]://perform?target=[tartget]&perform=[perform]
 *  target must is NSObjct under runtime
 */
@interface ARouterProtocolPerform : ARouterProtocol

@property (nonatomic, copy, readonly) NSString* target;
@property (nonatomic, strong, readonly) NSString* method;

@end

NS_ASSUME_NONNULL_END
