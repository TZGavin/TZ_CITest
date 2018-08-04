//
//  ViewController.m
//  UITest
//
//  Created by hzg on 2018/8/4.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) sum:(int)a with:(int)b {
    return a + b;
}

- (IBAction)onLoginButtonClicked:(UIButton *)sender {

    if ([self.userNameTextField.text isEqualToString:@"Admin"] && [self.passwordTextField.text isEqualToString:@"123456"]) {
        
        UIViewController* vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
        [self.navigationController pushViewController:vc animated:true];
    }
    
}

@end
