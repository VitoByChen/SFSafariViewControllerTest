
//
//  SFWebPaymentViewController.m
//  testSelf
//
//  Created by 陈锦彭 on 2019/4/30.
//  Copyright © 2019 陈锦彭. All rights reserved.
//

#import "SFWebPaymentViewController.h"

@interface SFWebPaymentViewController()<SFSafariViewControllerDelegate>

@end

@implementation SFWebPaymentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
//    self.delegate = self;
}

#pragma mark - SFSafariViewControllerDelegate
//点击 完成（done）按钮回调
-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    NSLog(@"safariViewControllerDidFinish");
}

//SFSafariViewController 的Url加载完成时调用, 子页面不会触发
-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{
    NSLog(@"didCompleteInitialLoad");
}
-(void)safariViewController:(SFSafariViewController *)controller initialLoadDidRedirectToURL:(NSURL *)URL{
//    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"initialLoadDidRedirectToURL-- url : %@", URL);
}

-(NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller activityItemsForURL:(NSURL *)URL title:(NSString *)title{
    NSLog(@"activityItemsForURL---url: %@---title: %@", URL, title);
//    UIActivity *act = [[UIActivity alloc] init];
//    act.
    return @[];
}

- (NSArray<UIActivityType> *)safariViewController:(SFSafariViewController *)controller excludedActivityTypesForURL:(NSURL *)URL title:(NSString *)title{
    return @[UIActivityTypeOpenInIBooks,UIActivityTypePostToWeibo];
}
@end
