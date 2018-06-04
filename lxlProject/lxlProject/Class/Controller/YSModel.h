//
//  YSModel.h
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/27.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSModel : NSObject
@property (nonatomic, assign) NSInteger rValue;
@property (nonatomic, assign) NSInteger gValue;
@property (nonatomic, assign) NSInteger bValue;
@property (nonatomic, strong) UIColor *myColor;

-(void)refeashColor;

@end
