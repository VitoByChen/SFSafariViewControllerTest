//
//  JPActivity.m
//  testSelf
//
//  Created by 陈锦彭 on 2019/4/30.
//  Copyright © 2019 陈锦彭. All rights reserved.
//

#import "JPActivity.h"

@implementation JPActivity
-(void)prepareWithActivityItems:(NSArray *)activityItems {
    NSLog(@"%@",activityItems);
}
-(UIActivityType)activityType {
    return UIActivityTypeMail;
}
-(NSString *)activityTitle {
    return @"ceshi";
}



@end
