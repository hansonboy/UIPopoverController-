//
//  JWPopverTableViewController.h
//  UIPoperViewController
//
//  Created by wangjianwei on 16/3/27.
//  Copyright © 2016年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWPopverTableViewController;
@protocol JWPopverTableViewControllerDelegate <NSObject>

-(void)popverTableViewControllerDidDismiss:(JWPopverTableViewController*)popverController;

@end

@interface JWPopverTableViewController : UITableViewController
@property (weak,nonatomic) id<JWPopverTableViewControllerDelegate> delegate;
@property (weak,nonatomic)UIPopoverController *popover;
@end
