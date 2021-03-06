// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ADAutoRequestViewController.h"
#import "ADLogger+Internal.h"

@interface ADAutoRequestViewController ()

@property (strong, nonatomic) IBOutlet UITextView *requestInfo;
@property (strong, nonatomic) IBOutlet UIButton *requestGo;

@end

@implementation ADAutoRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender {
    
    (void)sender;
    
    self.requestInfo.editable = NO;
    self.requestGo.enabled = NO;
    [self.requestGo setTitle:@"Running..." forState:UIControlStateDisabled];

    NSError* error = nil;
    NSDictionary* params = [NSJSONSerialization JSONObjectWithData:[self.requestInfo.text dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
    if (!params)
    {
        NSString *errorString = [NSString stringWithFormat:@"Error Domain=%@ Code=%ld Description=%@", error.domain, error.code, error.localizedDescription];
        
        params = @{ @"error" : errorString };
    }
    
    self.completionBlock(params);
}

@end
