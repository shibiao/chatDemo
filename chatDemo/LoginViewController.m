//
//  LoginViewController.m
//  chatDemo
//
//  Created by sycf_ios on 2017/3/30.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "LoginViewController.h"
@import Wilddog;
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic,strong) WDGAuth *auth;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WDGOptions *options = [[WDGOptions alloc] initWithSyncURL:@"https://sbchatdemo.wilddogio.com"];
    [WDGApp configureWithOptions:options];
    self.auth = [WDGAuth auth];
}
- (IBAction)signIn:(id)sender {
    [self.auth createUserWithEmail:self.accountTextField.text password:self.passwordTextField.text completion:^(WDGUser * _Nullable user, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"account:%@ ,password:%@",self.accountTextField.text,self.passwordTextField.text);
        }
    }];
    
}
- (IBAction)login:(id)sender {
    
    [self.auth signInWithEmail:self.accountTextField.text password:self.passwordTextField.text completion:^(WDGUser * _Nullable user, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"登录成功");
        }
        
    }];
}
- (IBAction)logout:(id)sender {
    NSError *error;
    [[WDGAuth auth] signOut:&error];
    if (!error) {
        NSLog(@"退出成功");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
