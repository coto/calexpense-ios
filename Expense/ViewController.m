//
//  ViewController.m
//  Expense
//
//  Created by @Coto on 7/15/15.
//  Copyright (c) 2015 Finvox. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Coto Rocks");
    
    
    if ([self isDataSourceAvailable]) {
        
        
        if ([self readJSON])
            [self updateDatabase];
    }
    else {
        [self queryDataInDatabase];
    }
    
    
    [self writeData];

}

-(BOOL)readJSON{

    NSHTTPURLResponse *response = nil;
    NSError *error = nil;

    // ---------------------- HERE INSERT YOUR SOURCE_API -------------->
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"-------- INSERT YOUR SOURCE API URL----------"]];

    
    NSData *datos = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    self.dataString = [[NSString alloc] initWithData:datos encoding:NSUTF8StringEncoding];
    
    if ([response statusCode] != 200)
        return NO;
    else {
        NSLog(@"Imprimo  dataString: %@", self.dataString);
    
        if (datos) {
            self.dataDiccionary = [NSJSONSerialization JSONObjectWithData:datos options:kNilOptions error:nil];
        }
        NSLog(@"COTO data histórica: %@", self.dataDiccionary[@"data"][0][2]);
        return YES;
    }
    
    
}

-(void)writeData{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setDecimalSeparator:@","];
    [formatter setGroupingSeparator:@"."];


    _dolar_value.text = [NSString stringWithFormat:@"$ %@", [self.dataDiccionary objectForKey:@"indicadores"][0][3] ];
    
    
    
    // @@@@@@@@@@@@@@@@@   Discrecionales @@@@@@@@@@@@@@@@@
    _d11.text = [self.dataDiccionary objectForKey:@"discrecionales"][0][0];
    NSString* d12 =    [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"discrecionales"][0][3] ];
    _d12.text =  [NSString stringWithFormat:@"$ %@", d12];
    _d21.text = [self.dataDiccionary objectForKey:@"discrecionales"][1][0];
    NSString* d22 =    [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"discrecionales"][1][3] ];
    _d22.text =  [NSString stringWithFormat:@"$ %@", d22];
    _d31.text = [self.dataDiccionary objectForKey:@"discrecionales"][2][0];
    NSString* d32 =   [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"discrecionales"][2][3] ];
    _d32.text =  [NSString stringWithFormat:@"$ %@", d32];
    _d41.text = [self.dataDiccionary objectForKey:@"discrecionales"][3][0];
    NSString* d42 =    [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"discrecionales"][3][3] ];
    _d42.text =  [NSString stringWithFormat:@"$ %@", d42];
    _d51.text = [self.dataDiccionary objectForKey:@"discrecionales"][4][0];
    NSString* d52 =    [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"discrecionales"][4][3] ];
    _d52.text =  [NSString stringWithFormat:@"$ %@", d52];

    if (d12.intValue < 0){
        _d12.textColor = [UIColor redColor];
    }
    if (d22.intValue < 0){
        _d22.textColor = [UIColor redColor];
    }
    if (d32.intValue < 0){
        _d32.textColor = [UIColor redColor];
    }
    if (d42.intValue < 0){
        _d42.textColor = [UIColor redColor];
    }
    if (d52.intValue < 0){
        _d52.textColor = [UIColor redColor];
    }
    
    NSString *dtimeStampString = [self.dataDiccionary objectForKey:@"discrecionales"][1][4];
    NSTimeInterval _dinterval=[dtimeStampString doubleValue];
    NSDate *ddate = [NSDate dateWithTimeIntervalSince1970:_dinterval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setDateFormat:@"EEE dd-MMM-yyyy HH:mm z"];
    //_d_date.text = [NSString stringWithFormat:@"%@.%@", [self.dataDiccionary objectForKey:@"discrecionales"][1][4], [_formatter stringFromDate:ddate]];
    _d_date.text = [_formatter stringFromDate:ddate];
    
    
    // @@@@@@@@@@@@@@@@@   Fijos @@@@@@@@@@@@@@@@@
    
    _f11.text = [self.dataDiccionary objectForKey:@"fijos"][0][0];
    NSString* f12 =  [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"fijos"][0][3] ];
    _f12.text =  [NSString stringWithFormat:@"$ %@", f12];
    _f21.text = [self.dataDiccionary objectForKey:@"fijos"][1][0];
    NSString* f22 =  [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"fijos"][1][3] ];
    _f22.text =  [NSString stringWithFormat:@"$ %@", f22];
    _f31.text = [self.dataDiccionary objectForKey:@"fijos"][2][0];
    NSString* f32 =  [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"fijos"][2][3] ];
    _f32.text =  [NSString stringWithFormat:@"$ %@", f32];
    _f41.text = [self.dataDiccionary objectForKey:@"fijos"][3][0];
    NSString* f42 =  [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"fijos"][3][3] ];
    _f42.text =  [NSString stringWithFormat:@"$ %@", f42];
    _f51.text = [self.dataDiccionary objectForKey:@"fijos"][4][0];
    NSString* f52 =  [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"fijos"][4][3] ];
    _f52.text =  [NSString stringWithFormat:@"$ %@", f52];
    
    if (f12.intValue < 0){
        _f12.textColor = [UIColor redColor];
    }
    if (f22.intValue < 0){
        _f22.textColor = [UIColor redColor];
    }
    if (f32.intValue < 0){
        _f32.textColor = [UIColor redColor];
    }
    if (f42.intValue < 0){
        _f42.textColor = [UIColor redColor];
    }
    if (f52.intValue < 0){
        _f52.textColor = [UIColor redColor];
    }
   
    NSString *ftimeStampString = [self.dataDiccionary objectForKey:@"fijos"][1][4];
    NSTimeInterval _finterval=[ftimeStampString doubleValue];
    NSDate *fdate = [NSDate dateWithTimeIntervalSince1970:_finterval];
    [_formatter setDateFormat:@"EEE dd-MMM-yyyy HH:mm z"];
    //_f_date.text = [NSString stringWithFormat:@"%@.%@", [self.dataDiccionary objectForKey:@"fijos"][1][4], [_formatter stringFromDate:fdate]];
    _f_date.text = [_formatter stringFromDate:fdate];

    // @@@@@@@@@@@@@@@@@   Saving @@@@@@@@@@@@@@@@@
    
    _s11.text = [self.dataDiccionary objectForKey:@"saving"][0][0];
    _s12.text =  [NSString stringWithFormat:@"$ %@", [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"saving"][0][3] ]];
    _s21.text = [self.dataDiccionary objectForKey:@"saving"][1][0];
    _s22.text =  [NSString stringWithFormat:@"$ %@", [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"saving"][1][3] ]];
    _s31.text = [self.dataDiccionary objectForKey:@"saving"][2][0];
    _s32.text =  [NSString stringWithFormat:@"$ %@", [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"saving"][2][3] ]];
    
    /*
    _long_term_value.text = [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"saving"][0][2] ];
    _short_term_value.text = [formatter stringFromNumber:[self.dataDiccionary objectForKey:@"saving"][1][2] ];

    int aux = 0;
    aux = [[self.dataDiccionary objectForKey:@"discrecionales"][3][2] intValue] + ([[self.dataDiccionary objectForKey:@"discrecionales"][4][2] intValue] * 600)+ [[self.dataDiccionary objectForKey:@"fijos"][5][2] intValue] + ([[self.dataDiccionary objectForKey:@"fijos"][6][2] intValue] * [[self.dataDiccionary objectForKey:@"indicadores"][0][2] intValue]);
    _credit_cards.text = [NSString stringWithFormat:@"$ %d", aux];
    
    */
    
    
}


- (BOOL)isDataSourceAvailable
{
    BOOL checkNetwork = YES;
    BOOL isDataSourceAvailable = YES;
    if (checkNetwork) { // Since checking the reachability of a host can be expensive, cache the result and perform the reachability check once.
        checkNetwork = NO;
        
        Boolean success;
        const char *host_name = "google.com"; // your data source host name
        
        SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
        SCNetworkReachabilityFlags flags;
        success = SCNetworkReachabilityGetFlags(reachability, &flags);
        isDataSourceAvailable = success && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
        CFRelease(reachability);
    }
    return isDataSourceAvailable;
}

- (BOOL)queryDataInDatabase{
    self.name = [[NSMutableArray alloc] init];
    self.valor = [[NSMutableArray alloc] init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    NSPredicate *pred =[NSPredicate predicateWithFormat:@"(name = %@)", @"indices"];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if ([objects count] == 0){
        NSLog(@"No matches");
        return NO;
    }else{
        for (int i = 0; i < [objects count]; i++)
        {
            matches = objects[i];
            [self.name addObject:[matches valueForKey:@"name"]];
            [self.valor addObject:[matches valueForKey:@"valor"]];
        }
        NSLog(@"Matches valor: %@", self.valor);
        NSData* data= [self.valor[0] dataUsingEncoding:NSUTF8StringEncoding];
        self.dataDiccionary = [NSJSONSerialization
                                               JSONObjectWithData:data
                                               options:kNilOptions
                                               error:&error];
        
        NSLog(@"Dic Saved %@", self.dataDiccionary);

        return YES;
    }
}

- (void)updateDatabase{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSMutableArray *contactarray = [[context executeFetchRequest:request error:nil] mutableCopy];
    
    if (contactarray.count == 1)
        [context deleteObject:contactarray[0]];
    
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:context];
    [newContact setValue: @"indices" forKey:@"name"];
    [newContact setValue: self.dataString forKey:@"valor"];
    NSError *error;
    [context save:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    NSLog(@"Coto Refresh");
    
    
    if ([self isDataSourceAvailable]) {
        
        
        if ([self readJSON]) {
            [self updateDatabase];
            [self writeData];
        }
    }

    
    
}
@end
