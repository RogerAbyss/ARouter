//
//  AViewController.m
//  ARouter
//
//  Created by RogerAbyss on 07/20/2017.
//  Copyright (c) 2017 RogerAbyss. All rights reserved.
//

#import "AViewController.h"
#import "ARouter.h"

@interface AViewController ()
@property (nonatomic, copy) NSString* a;
@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [ARouter selfChecking];
//    [ARouter global].nav = self.navigationController;
//    
//    dispatch_after(2, dispatch_get_main_queue(), ^{
//        [ARouter handle:@"test://push?target=AViewController&a=1"];
//    });
//    
//    NSLog(@"%@",self.a);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
