//
//  baseView.m
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/26.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "baseView.h"

@implementation baseView

+ (UIView *)createView:(int)sender
{
    baseView *view = [baseView new];

    NSString *title = @[@"R",@"G",@"B"][sender];
    UILabel *baseLabel = Label.fnt(17).str(title);
    UISlider *baseSlider = Slider.maxVal(255).minVal(0);
    UITextField *baseText = TextField.hint(title).fnt(17).borderRadius(4).fixWidth(50).border(1,@"black").centerAlignment.numberKeyboard;

    HorStack(@10,baseLabel,baseSlider,baseText,NERSpring).gap(10).embedIn(view);

    view.useText = baseText;
    view.useSlider = baseSlider;

    return view;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
