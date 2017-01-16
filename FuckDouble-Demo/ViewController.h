//
//  ViewController.h
//  FuckDouble-Demo
//
//  Created by Jakey on 16/6/22.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSDictionary *_responseObject;
    NSString *_opration;
}
@property (weak, nonatomic) IBOutlet UILabel *readLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *oprationButtons;

- (IBAction)oprationSelect:(id)sender;
//使用NSNumber double进行计算
- (IBAction)calDouble:(id)sender;
//使用NSDecimalNumber double进行计算
- (IBAction)calDoubleWithNSDecimalNumber:(id)sender;
//如何格式化输出double值而不丢失精度
- (IBAction)output:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *resultLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel22;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel23;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel24;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel25;


@end

