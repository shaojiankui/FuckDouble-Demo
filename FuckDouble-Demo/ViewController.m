//
//  ViewController.m
//  FuckDouble-Demo
//
//  Created by Jakey on 16/6/22.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _responseObject = [self loadJSON:@"testJSON"];
    NSNumber *fuckNumber3 = [_responseObject objectForKey:@"fuckNumber3"];
    self.readLabel.text  = [NSString stringWithFormat:@"%g",  fuckNumber3.doubleValue];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*)loadJSON:(NSString*)jsonName{
    NSError *errorString;
    NSError *errorJSON;
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
    NSString *jsonString=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&errorString];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJSON];
    return jsonDict;
}
- (IBAction)oprationSelect:(UIButton*)sender {
    for (UIButton *button in self.oprationButtons) {
        if (button == sender) {
            button.selected = YES;
            _opration = button.titleLabel.text;
        }else{
            button.selected = NO;
        }
    }
}

#pragma mark -- 使用NSNumber double进行计算
- (IBAction)calDouble:(id)sender {
    NSNumber *fuckNumber3 = [_responseObject objectForKey:@"fuckNumber3"];
    double inputNumber = [self.inputTextField.text doubleValue];
    
    double result = [fuckNumber3 doubleValue];

    if ([_opration isEqualToString:@"+"]) {
        result = [fuckNumber3 doubleValue] + inputNumber;
    }
    else if ([_opration isEqualToString:@"-"]) {
        result = [fuckNumber3 doubleValue] - inputNumber;
    }
    else if ([_opration isEqualToString:@"*"]) {
        result = [fuckNumber3 doubleValue] * inputNumber;
    }
    else if ([_opration isEqualToString:@"/"]) {
        result = [fuckNumber3 doubleValue] / inputNumber;
    }
  
    NSLog(@"=================   double    ===============");
    self.resultLabel.text = [NSString stringWithFormat:@"%g",result];
    NSLog(@"result Double:%g",result);
    NSLog(@"NSNSNumber String:%@",[@(result) stringValue]);
    NSLog(@"%%g String:%@",[NSString stringWithFormat:@"%g",result]);
    NSLog(@"=============================================");

}
#pragma mark --使用NSDecimalNumber double进行计算
- (IBAction)calDoubleWithNSDecimalNumber:(id)sender {
    NSNumber *fuckNumber3 = [_responseObject objectForKey:@"fuckNumber3"];
    
    NSDecimalNumber *result2 = [self calculateDecimalNumberWithOpration:_opration
                                                             leftNumber:[NSDecimalNumber decimalNumberWithDecimal:[fuckNumber3 decimalValue]]
                                                            rightNumber:[NSDecimalNumber decimalNumberWithString:self.inputTextField.text]];
    NSLog(@"=================NSDecimalNumber=============");
    self.resultLabel.text = [NSString stringWithFormat:@"%g",result2.doubleValue];
    NSLog(@"result2.doubleValue:%g",result2.doubleValue);
    NSLog(@"result2.stringValue:%@",[result2 stringValue]);
    NSLog(@"%%g String:%@",[NSString stringWithFormat:@"%g",result2.doubleValue]);
    NSLog(@"=============================================");

}
#pragma mark -- 如何格式化输出double值而不丢失精度
- (IBAction)output:(id)sender {
    double dTest = 0.088;
    NSNumber *dTestNumber = @(dTest);
    NSNumber *dTestNumber2 = [NSDecimalNumber numberWithDouble:dTestNumber.doubleValue];

    self.resultLabel2.text = [NSString stringWithFormat:@"%lf",dTest]; //%lf丢失精度
    self.resultLabel22.text = [dTestNumber stringValue];  //NSNumber stringValue丢失精度
    self.resultLabel23.text = [dTestNumber2 stringValue]; //NSDecimalNumber stringValue丢失精度
    self.resultLabel24.text = [NSString stringWithFormat:@"%g",dTest];  //%g不丢失精度

    NSString *doubleString        = [NSString stringWithFormat:@"%lf", dTest];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    self.resultLabel25.text =  [decNumber stringValue];  //decimalNumberWithString 不丢失精度
}

- (NSDecimalNumber *)calculateDecimalNumberWithOpration:(NSString *)opration
                                             leftNumber:(NSDecimalNumber *)leftNumber
                                            rightNumber:(NSDecimalNumber *)rightNumber
{
    assert(![leftNumber isEqual:[NSDecimalNumber notANumber]]);
    assert(![rightNumber isEqual:[NSDecimalNumber notANumber]]);
    
    NSString *token;
    if ([@"+" isEqualToString:opration]) {
        token = [[leftNumber decimalNumberByAdding:rightNumber] stringValue];
        
    } else if ([@"-" isEqualToString:opration]) {
        token = [[leftNumber decimalNumberBySubtracting:rightNumber] stringValue];
        
    } else if ([@"*" isEqualToString:opration]) {
        token = [[leftNumber decimalNumberByMultiplyingBy:rightNumber] stringValue];
        
    } else if ([@"/" isEqualToString:opration]) {
        token = [[leftNumber decimalNumberByDividingBy:rightNumber] stringValue];
        
    } else if ([@"^" isEqualToString:opration]) {
        token = [[leftNumber decimalNumberByRaisingToPower:rightNumber.integerValue] stringValue];
    }
    return [NSDecimalNumber decimalNumberWithString:token];
}

@end
