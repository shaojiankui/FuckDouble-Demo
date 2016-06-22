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
- (IBAction)calTouched:(id)sender;
- (IBAction)cal3Touched:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *resultLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel22;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel23;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel24;

- (IBAction)cal2Touched:(id)sender;

@end

