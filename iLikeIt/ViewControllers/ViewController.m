//
//  ViewController.m
//  iLikeIt
//
//  Created by Kauserali on 04/03/14.
//  Copyright (c) 2014 Raywenderlich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *likeButton;
@property (nonatomic, weak) IBOutlet UILabel *salesCountLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

//demo  tutorail http://www.cocoachina.com/industry/20140526/8554.html

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _salesCountLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Yesterday you sold %@ apps", nil),  [self formatLargeNumber:@(1000000)]];
    [_likeButton setTitle:NSLocalizedString(@"You like?", nil) forState:UIControlStateNormal];
}

//这里对1000000做出相应的处理  西班牙的大型数据不是用都好分割，而是用点.
- (NSString *)formatLargeNumber:(NSNumber *)number
{
    NSNumberFormatter * numFormatter = [[NSNumberFormatter alloc]init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString * numString = [numFormatter stringFromNumber:@(1000000)];
    return numString;
}

- (IBAction)youLikeButtonPressed:(id)sender {
    if (_salesCountLabel.hidden == YES) {
        _salesCountLabel.hidden = NO;
        _imageView.hidden = NO;
        _salesCountLabel.alpha = 0;
        _imageView.alpha = 0;
        
        [UIView animateWithDuration:1 animations:^(){
            _salesCountLabel.alpha = 1;
            _imageView.alpha = 1;
        } completion:^(BOOL finished) {
            if (finished) {
                _salesCountLabel.hidden = YES;
                _imageView.hidden = YES;
            }
        }];
    }
}
@end
