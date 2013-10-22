//
//  TempConverterViewController.m
//  tempConverter
//
//  Created by Milan Brahmbhatt on 10/9/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tempControl;
@property (weak, nonatomic) IBOutlet UILabel *inputUnit;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

- (IBAction)onTap:(id)sender;
- (NSString*)celciusToFahrenheit:(NSString*) celcius;
- (NSString*)fahrenheitToCelcius:(NSString*) fahrenheit;
- (IBAction)didClickConvert:(id)sender;
- (void)convert;
- (void)initValues;
@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self initValues];
}

- (void)initValues
{
    // 0 = Fahrenheit, 1 = Celcius
    if (self.tempControl.selectedSegmentIndex == 0) {
        self.inputUnit.text = @"°F";
        self.resultLabel.text = @"0.0  °C";
    } else {
        self.inputUnit.text = @"°C";
        self.resultLabel.text = @"0.0 °F";
    }
    
    self.inputText.delegate = self;
}

- (void)convert {
    // 0 = Fahrenheit, 1 = Celcius
    if (self.tempControl.selectedSegmentIndex == 0) {
        self.inputUnit.text = @"°F";
        self.resultLabel.text = [self fahrenheitToCelcius:self.inputText.text];
    } else {
        self.inputUnit.text = @"°C";
        self.resultLabel.text = [self celciusToFahrenheit:self.inputText.text];
    }
    self.inputText.text = [NSString stringWithFormat:@"%0.1f",[self.inputText.text floatValue]];
}

- (NSString*)fahrenheitToCelcius:(NSString *)fahrenheit
{
    float celcius = 5./9. * ([fahrenheit floatValue]-32.);
    return [NSString stringWithFormat:@"%0.1f °C", celcius];
}

- (IBAction)didClickConvert:(id)sender {
    [self convert];
    [self.view endEditing:YES];
}

- (NSString*)celciusToFahrenheit:(NSString *)celcius
{
    float fahrenheit = 9./5. * ([celcius floatValue]+32.);
    return [NSString stringWithFormat:@"%0.1f °F", fahrenheit];
}

@end
