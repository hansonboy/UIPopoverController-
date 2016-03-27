//
//  ViewController.m
//  UIPoperViewController
//
//  Created by wangjianwei on 16/3/27.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "ViewController.h"
#import "JWPopverTableViewController.h"
const NSString *JWPopoverShouldDismiss =  @"JWPopoverShouldDismiss";
@interface ViewController ()<UIPopoverControllerDelegate,JWPopverTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (strong,nonatomic)UIPopoverController *popverController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *item;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong,nonatomic) UIViewController *modalController;
@end

@implementation ViewController
-(void)popverTableViewControllerDidDismiss:(JWPopverTableViewController *)popverController{
    [self.popverController dismissPopoverAnimated:YES];
}
- (IBAction)showModal:(id)sender {
    UIViewController *controller = [[UIViewController alloc]init];
    controller.view.backgroundColor = [UIColor yellowColor];
    self.modalController = controller;
    [controller.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissView)] ];
//    
//    typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
//        UIModalPresentationFullScreen = 0,
//        UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//        UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//        UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
//        UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
//        UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
//        UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
//        UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
//        UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
//    };
    controller.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    controller.popoverPresentationController.sourceView = self.button;
    controller.popoverPresentationController.sourceRect  = self.button.bounds;
    
    [self presentViewController:controller animated:YES completion:nil];
    
}
-(void)dismissView{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
-(UIPopoverController *)popverController{
    if (_popverController  == nil) {
        
        JWPopverTableViewController *controller = [[JWPopverTableViewController alloc]init];
        controller.delegate  = self;
        _popverController = [[UIPopoverController alloc]initWithContentViewController:controller];
         controller.popover = _popverController;
        _popverController.delegate = self;
        [[NSNotificationCenter defaultCenter]addObserver:_popverController selector:@selector(dismissPopoverAnimated:) name:JWPopoverShouldDismiss object:nil];
        
        _popverController.passthroughViews = @[self.otherButton ];
    }
    return _popverController;

}
- (IBAction)buttonClick:(UIButton *)sender {
    [self.popverController presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
- (IBAction)barButtonItemClick:(id)sender {
   
    [self.popverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    NSLog(@"popverController 消失了");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self.popverController name:JWPopoverShouldDismiss object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
