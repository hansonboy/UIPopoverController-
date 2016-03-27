//
//  JWPopverTableViewController.m
//  UIPoperViewController
//
//  Created by wangjianwei on 16/3/27.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "JWPopverTableViewController.h"

@implementation JWPopverTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.preferredContentSize = CGSizeMake(320, 44*10);
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.popover dismissPopoverAnimated:YES];
    extern NSString *JWPopoverShouldDismiss;
    [[NSNotificationCenter defaultCenter]postNotificationName:JWPopoverShouldDismiss object:nil];
    NSLog(@"%d--%@",indexPath.row,self.popoverPresentationController);
}
@end
