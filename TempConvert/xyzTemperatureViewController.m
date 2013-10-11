//
//  xyzTemperatureViewController.m
//  TempConvert
//
//  Created by ppanda on 10/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "xyzTemperatureViewController.h"

@interface xyzTemperatureViewController ()

@end

@implementation xyzTemperatureViewController
@synthesize textCelsius;
@synthesize textFarenheit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)viewDidUnload
{
    [self setTextFarenheit:nil];
    [self setTextCelsius:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onTouchDown:(id)sender {
    [self updateValues];
}

- (IBAction)onFarenheitChange:(id)sender {
    [self.view endEditing:TRUE]; 
    [self convertToCelsius];
}

- (IBAction)onCelsiusChange:(id)sender {
    [self.view endEditing:TRUE]; 
    [self convertToFarenheit];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:TRUE]; 
}



// perform the conversion of temperature here
- (void) updateValues {
    self.textCelsius.text = @"0";
    self.textFarenheit.text = @"0";
}

// convert the value in the Farenheit field to celsius
- (void) convertToCelsius {
    
    // use formula c = (f - 32) * 5/9
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:self.textFarenheit.text];
    [f release];
    
    float farenheit = [myNumber floatValue];
    float celsius = ( farenheit - 32.0f ) * 5.0f/9.0f;
    
    self.textCelsius.text = [NSString stringWithFormat:@"%.1f", celsius];
}



// convert the value in the Farenheit field to celsius
- (void) convertToFarenheit {
    
    // use formula f = (c * 9/5) + 32)
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:self.textCelsius.text];
    [f release];
    
    float celsius = [myNumber floatValue];
    float farenheit = ( celsius * 9.0f/5.0f ) +  32.0f;
    
    self.textFarenheit.text = [NSString stringWithFormat:@"%.1f", farenheit];
}


- (void)dealloc {
    [textFarenheit release];
    [textCelsius release];
    [super dealloc];
}
@end
