//
//  xyzTemperatureViewController.h
//  TempConvert
//
//  Created by ppanda on 10/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface xyzTemperatureViewController : UIViewController
- (IBAction)onTouchDown:(id)sender;
- (IBAction)onFarenheitChange:(id)sender;
- (IBAction)onCelsiusChange:(id)sender;
- (IBAction)onTap:(id)sender;


@property (retain, nonatomic) IBOutlet UITextField *textFarenheit;
@property (retain, nonatomic) IBOutlet UITextField *textCelsius;

@end
