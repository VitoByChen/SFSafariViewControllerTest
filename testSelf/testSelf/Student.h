//
//  Student.h
//  testSelf
//
//  Created by 陈锦彭 on 2019/4/26.
//  Copyright © 2019 陈锦彭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Study)(void);
@interface Student : NSObject

@property (copy , nonatomic) NSString *name;
@property (copy , nonatomic) Study study;

@end

NS_ASSUME_NONNULL_END
