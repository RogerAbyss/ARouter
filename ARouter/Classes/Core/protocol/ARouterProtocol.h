//
//  ARouterRule.h
//  Pods
//
//  Created by Abyss on 2017/6/3.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  [scheme]://[operation]?[param]
 */

@interface ARouterProtocol : NSObject

- (NSString *)operation;
- (void)handle:(NSArray<NSURLQueryItem *> *)queryItems;

@end

NS_ASSUME_NONNULL_END
