//
//  baseView.h
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/26.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface baseView : UIView

@property (nonatomic, strong) UISlider *useSlider;
@property (nonatomic, strong) UITextField *useText;

+ (instancetype)createView:(int)sender;

@end
