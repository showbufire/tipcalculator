//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Xiao Jiang on 10/11/14.
//
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)onTap:(id)sender;

- (void)storePreference;
- (void)loadPreference;

@end

@implementation SettingsViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPreference];
}

- (IBAction)onTap:(id)sender {
    [self storePreference];
}

- (void) storePreference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"tipidx"];
    [defaults synchronize];
}

- (void) loadPreference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTip = [defaults integerForKey:@"tipidx"];
    self.defaultTipControl.selectedSegmentIndex = defaultTip;
}

@end