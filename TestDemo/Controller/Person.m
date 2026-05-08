//
//  Person.m
//  TestDemo
//
//  Created by chongzhang on 2026/5/6.
//

#import "Person.h"
#import "TestDemo-Swift.h"

@implementation Person
- (void)testGCD {
    
//    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(self.timer, ^{
//        NSLog(@"asdf asdf as dfs ");
//    });
//    dispatch_activate(self.timer);
//

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"10 seconds");
    });

    LuckMan *man = [[LuckMan alloc]init];
    [man eatWithFood:@"榴莲"];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0) , ^{
        NSLog(@"task 1");
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0) , ^{
        NSLog(@"task 2");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0) , ^{
        NSLog(@"task 3");
    });
    

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0) , ^{
        NSLog(@"task 4");
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"task 5");
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
