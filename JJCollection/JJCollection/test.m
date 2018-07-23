//
//  test.m
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "test.h"

@implementation test

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 20)];
        lab.text = @"XXXXXX";
        lab.textColor = [UIColor redColor];
        [self addSubview:lab];
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
- (void)asd
{
    self.backgroundColor = [UIColor blueColor];
}
@end
