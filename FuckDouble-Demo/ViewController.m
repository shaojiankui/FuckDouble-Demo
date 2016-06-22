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


- (IBAction)calTouched:(id)sender {
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

- (IBAction)cal3Touched:(id)sender {
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

- (IBAction)cal2Touched:(id)sender {
    double dTest = 0.088;
    NSNumber *dTestNumber = @(dTest);
    NSNumber *dTestNumber2 = [NSDecimalNumber numberWithDouble:dTestNumber.doubleValue];

    self.resultLabel2.text = [NSString stringWithFormat:@"%lf",dTest];
    self.resultLabel22.text = [dTestNumber stringValue];
    self.resultLabel23.text = [dTestNumber2 stringValue];
    self.resultLabel24.text = [NSString stringWithFormat:@"%g",dTest];

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
