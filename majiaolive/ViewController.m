//
//  ViewController.m
//  majiaolive
//
//  Created by liuxianjie on 16/6/29.
//  Copyright © 2016年 majiao. All rights reserved.
//

#import "ViewController.h"
#import "PPYToolkit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *uuid = [NSString UUID];
    NSLog(@"%@",uuid);
    DLog("%@",uuid);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
