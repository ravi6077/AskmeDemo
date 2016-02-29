//
//  HeaderView.m
//  AskmeDemo
//
//  Created by Ravinder on 27/02/16.
//  Copyright © 2016 Ravinder. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        return nil;
    }
    
    // 1. load the interface
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    // 2. add as subview
    [self addSubview:self.view];
    
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    NSArray *views = [mainBundle loadNibNamed:NSStringFromClass([self class])
//                                        owner:nil
//                                      options:nil];
//    [self addSubview:views[0]];
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
