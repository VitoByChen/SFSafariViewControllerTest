//
//  ViewController2.m
//  testSelf
//
//  Created by 陈锦彭 on 2019/4/26.
//  Copyright © 2019 陈锦彭. All rights reserved.
//

#import "ViewController2.h"
#import "Student.h"
#import <SafariServices/SafariServices.h>
#import <AuthenticationServices/AuthenticationServices.h>
@interface ViewController2 ()
/**<#name#>*/
@property (nonatomic, strong) NSString *name;
/**<#name#>*/
@property (nonatomic, strong) SFAuthenticationSession *auth;
@property (nonatomic, strong) ASWebAuthenticationSession *asAuth;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
   
    if (@available(iOS 12, *)) {
        self.asAuth = [[ASWebAuthenticationSession alloc] initWithURL:[NSURL URLWithString:@"http://localhost:8000/Test.html"] callbackURLScheme:@"xtshow" completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
            //用户点击取消时，会出现error：SFAuthenticationErrorCanceledLogin
            NSLog(@"%@---%@",callbackURL,error);
        }];
        [self.asAuth start];
    }else {
        self.auth = [[SFAuthenticationSession alloc] initWithURL:[NSURL URLWithString:@"http://localhost:8000/Test.html"] callbackURLScheme:@"xtshow" completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
            //用户点击取消时，会出现error：SFAuthenticationErrorCanceledLogin
            NSLog(@"%@---%@",callbackURL,error);
        }];
        [self.auth start];
    }
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

-(void)testSel {
    NSLog(@"%@",self);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
