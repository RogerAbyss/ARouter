//
//  AViewController.m
//  ARouter
//
//  Created by RogerAbyss on 07/20/2017.
//  Copyright (c) 2017 RogerAbyss. All rights reserved.
//

#import "AViewController.h"
#import <ARouter/ARouter.h>

@interface AViewController ()
@property (nonatomic, copy) NSString* a;
@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [ARouter selfChecking];
    APP_ROUTER.nav = self.navigationController;
    
//    [ARouter handle:@"test://push?target=AViewController&a=1"];
    [ARouter handle:@"test://perform?target=AViewController&method=hello"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)hello
{
    NSLog(@"hello");
}

@end
