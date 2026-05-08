//
//  Person.h
//  TestDemo
//
//  Created by chongzhang on 2026/5/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic, strong) dispatch_source_t timer;
- (void)testGCD;
@end

NS_ASSUME_NONNULL_END
