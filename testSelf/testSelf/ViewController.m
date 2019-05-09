//
//  ViewController.m
//  testSelf
//
//  Created by 陈锦彭 on 2019/4/26.
//  Copyright © 2019 陈锦彭. All rights reserved.
//

#import "ViewController.h"

#import "ViewController2.h"
#import "SFWebPaymentViewController.h"
#import "JPActivity.h"
@interface ViewController ()<SFSafariViewControllerDelegate>
/**<#name#>*/
@property (nonatomic, strong) NSString *name;
/**<#name#>*/
@property (nonatomic, assign) BOOL is_startup;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ViewController2 *vc = [[ViewController2 alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"初始页面";
    [self.view addSubview:label];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(safariCallback:) name:@"SafariCallback" object:nil];
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidAppear:(BOOL)animated {
   
}

- (BOOL)showSafariPage {
    if ([SFSafariViewController class]) {
        NSURL *url = [NSURL URLWithString:@"http://localhost:8000/?redirect"];
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
        safariVC.delegate = self;
        [self presentViewController:safariVC animated:YES completion:nil];
        return YES;
    }
    return NO;
}

- (void)safariCallback:(NSNotification *)notification {
    // Dismiss View
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Extract information from notification
    NSDictionary *dict = [notification userInfo];
    NSString *value = [dict objectForKey:@"key"];
    NSLog(@"Value is %@", value);
    
    // Show result as alert dialog
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Key content" message:value preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
//    [alert addAction:okButton];
//    [self presentViewController:alert animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8000/Test.html"];
    SFWebPaymentViewController *vc = [[SFWebPaymentViewController alloc] initWithURL:url];
    vc.delegate = self;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
   
    //ios 11.0 later
//    [self jumpToViewController2];
    
}
-(void)openSFSafariViewController {
    BOOL isSafariViewSupported = [self showSafariPage];
    NSLog(@"Support? %d", isSafariViewSupported);
    if (!isSafariViewSupported) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"iOS version is less than 9" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)jumpToViewController2 {
    
    ViewController2 *vc = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:true];
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
//    ViewController2 *vc = [[ViewController2 alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
//    [self dismissViewControllerAnimated:YES completion:^{
//    }];
    NSLog(@"initialLoadDidRedirectToURL-- url : %@", URL);
}

-(NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller activityItemsForURL:(NSURL *)URL title:(NSString *)title{
    NSLog(@"activityItemsForURL---url: %@---title: %@", URL, title);
        UIActivity *act = [[JPActivity alloc] init];
    //    act.
    return @[act];
}

- (NSArray<UIActivityType> *)safariViewController:(SFSafariViewController *)controller excludedActivityTypesForURL:(NSURL *)URL title:(NSString *)title{
    return @[UIActivityTypeOpenInIBooks,UIActivityTypePostToWeibo];
}

@end


