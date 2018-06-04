//
//  YSModel.m
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/27.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSModel.h"

@implementation YSModel

-(void)refeashColor
{
    CGFloat r = self.rValue / 255.0;
    CGFloat g = self.gValue / 255.0;
    CGFloat b = self.bValue / 255.0;
    self.myColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    //_myColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    // 截然不同的效果self.是调用set方法。_是直接对属性进行复制，不会调用set方法。RACObserver是观察的set方法。当set方法的时候才会进行观察，所以使用_进行赋值是不会出发RAC的观察者的。
}

@end
