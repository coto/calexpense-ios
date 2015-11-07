//
//  ViewController.h
//  Expense
//
//  Created by @Coto on 7/15/15.
//  Copyright (c) 2015 Finvox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dolar_value;

@property (weak, nonatomic) IBOutlet UILabel *long_term_value;
@property (weak, nonatomic) IBOutlet UILabel *short_term_value;

@property (weak, nonatomic) IBOutlet UILabel *d_date;
@property (weak, nonatomic) IBOutlet UILabel *f_date;

@property (weak, nonatomic) IBOutlet UILabel *d11;
@property (weak, nonatomic) IBOutlet UILabel *d12;
@property (weak, nonatomic) IBOutlet UILabel *d21;
@property (weak, nonatomic) IBOutlet UILabel *d22;
@property (weak, nonatomic) IBOutlet UILabel *d31;
@property (weak, nonatomic) IBOutlet UILabel *d32;
@property (weak, nonatomic) IBOutlet UILabel *d41;
@property (weak, nonatomic) IBOutlet UILabel *d42;
@property (weak, nonatomic) IBOutlet UILabel *d51;
@property (weak, nonatomic) IBOutlet UILabel *d52;

@property (weak, nonatomic) IBOutlet UILabel *f11;
@property (weak, nonatomic) IBOutlet UILabel *f12;
@property (weak, nonatomic) IBOutlet UILabel *f21;
@property (weak, nonatomic) IBOutlet UILabel *f22;
@property (weak, nonatomic) IBOutlet UILabel *f31;
@property (weak, nonatomic) IBOutlet UILabel *f32;
@property (weak, nonatomic) IBOutlet UILabel *f41;
@property (weak, nonatomic) IBOutlet UILabel *f42;
@property (weak, nonatomic) IBOutlet UILabel *f51;
@property (weak, nonatomic) IBOutlet UILabel *f52;


@property (weak, nonatomic) IBOutlet UILabel *s11;
@property (weak, nonatomic) IBOutlet UILabel *s12;
@property (weak, nonatomic) IBOutlet UILabel *s21;
@property (weak, nonatomic) IBOutlet UILabel *s22;
@property (weak, nonatomic) IBOutlet UILabel *s31;
@property (weak, nonatomic) IBOutlet UILabel *s32;



@property (strong, nonatomic) NSString *dataString;

@property (strong, nonatomic) NSDictionary *dataDiccionary;
@property (strong, nonatomic) NSMutableArray *name;
@property (strong, nonatomic) NSMutableArray *valor;

- (IBAction)refresh:(id)sender;

@end

