//
//  SegmentedControl.m
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "SegmentedControl.h"
@implementation SegmentedControl

- (id)initWithFrame:(CGRect)frame withItems: (NSArray*)items {
    _color = [UIColor appColor];
    if (self) {
        self = [self initWithItems:  items];
        [self setupView: frame];
    }
    [self layoutSubviews];
    return self;
}

-(void) setupView:(CGRect)frame  {
    self.frame = frame;
    self.layer.borderColor = [UIColor lightColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.masksToBounds = true;
    [self setTintColor:_color];
    [self setSelectedSegmentIndex:0];
}


@end
