//
//  MYAnimalCollectionViewCell.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/23.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimalCollectionViewCell.h"

#import "MYAnimal.h"
#import "MYRandomFloat.h"

/**
 *  バックグラウンドビューのコーナー半径
 */
static const CGFloat BackgroundViewCornerRadius = 3.0f;

/**
 *  振動周期の半分の秒数（s)の初期値
 */
static const NSTimeInterval InitialVibratingTimeHalfInterval = 0.15f;

/**
 *  振動の最大角（ラジアン）
 */
static const CGFloat InitialMaximumVibratingAngle = 1.0f * M_PI / 180.0f;

@interface MYAnimalCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation MYAnimalCollectionViewCell

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _vibrating = NO;
        _vibratingTimeHalfInterval = InitialVibratingTimeHalfInterval;
        _maximumVibratingAngle = InitialMaximumVibratingAngle;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundView.layer.cornerRadius = BackgroundViewCornerRadius;
}

#pragma mark - Accessor methods

- (void)setAnimal:(MYAnimal *)animal
{
    _animal = animal;
    
    self.nameLabel.text = animal.name;
    [self.nameLabel sizeToFit];
    self.ageLabel.text = [@(animal.age) stringValue];
    [self.ageLabel sizeToFit];
}

- (void)setVibrating:(BOOL)vibrating
{
    _vibrating = vibrating;
    
    if (vibrating) {
        [self startVibrating];
    } else {
        [self endVibrating];
    }
}

#pragma mark - Private methods

- (void)startVibrating
{
    CGFloat randomDelayTime =
    CGFloatMakeInRandomWithMaximumFloat(self.vibratingTimeHalfInterval);
    
    [UIView
     animateWithDuration:self.vibratingTimeHalfInterval
     delay:randomDelayTime
     options:
     UIViewAnimationCurveEaseInOut |
     UIViewAnimationOptionAllowUserInteraction
     animations:^{
         self.backgroundView.transform =
         CGAffineTransformRotate(CGAffineTransformIdentity, self.maximumVibratingAngle);
     }
     completion:^(BOOL finished) {
         [UIView
          animateWithDuration:self.vibratingTimeHalfInterval
          delay:0.0f
          options:
          UIViewAnimationOptionCurveEaseInOut |
          UIViewAnimationOptionAutoreverse |
          UIViewAnimationOptionRepeat |
          UIViewAnimationOptionAllowUserInteraction
          animations:^{
              self.backgroundView.transform =
              CGAffineTransformRotate(CGAffineTransformIdentity, -self.maximumVibratingAngle);
          }
          completion:nil];
     }];
}

- (void)endVibrating
{
    [self.backgroundView.layer removeAllAnimations];
    [UIView
     animateWithDuration:self.vibratingTimeHalfInterval
     animations:^{
         self.backgroundView.transform = CGAffineTransformIdentity;
     }];
}

@end
