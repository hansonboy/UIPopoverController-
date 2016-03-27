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

@property (strong,nonatomic)UIPopoverController *popverController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *item;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController
-(void)popverTableViewControllerDidDismiss:(JWPopverTableViewController *)popverController{
    [self.popverController dismissPopoverAnimated:YES];
}
-(UIPopoverController *)popverController{
    if (_popverController  == nil) {
        
        JWPopverTableViewController *controller = [[JWPopverTableViewController alloc]init];
        controller.delegate  = self;
        _popverController = [[UIPopoverController alloc]initWithContentViewController:controller];
         controller.popover = _popverController;
        _popverController.delegate = self;
        [[NSNotificationCenter defaultCenter]addObserver:_popverController selector:@selector(dismissPopoverAnimated:) name:JWPopoverShouldDismiss object:nil];
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
