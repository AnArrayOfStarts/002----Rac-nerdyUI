//
//  YSViewController.m
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/26.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSViewController.h"

// 获得导航栏高度
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height



@interface YSViewController ()
@property (nonatomic, strong) YSModel *modelColor;
@end

@implementation YSViewController
{
    baseView *rView;
    baseView *gView;
    baseView *bView;
    UIView *rgbView;
    
    UIView *colorView;
    UIButton *pushBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ceshi";
    self.view.backgroundColor = [UIColor whiteColor];

    if (!_modelColor) {
        _modelColor = [YSModel new];
    }

    // nerdyui 自动布局
    rView = [baseView createView:0];
    gView = [baseView createView:1];
    bView = [baseView createView:2];

    rgbView = View.embedIn(self.view,getRectNavAndStatusHight+10,0,0,0);
    colorView = View.border(1).borderRadius(50).fixHeight(100);
    pushBtn  = Button.str(@"push");
    
    VerStack(@10,
             rView,
             gView,
             bView,
             colorView,
             pushBtn,
             NERSpring).gap(10).centerAlignment.embedIn(rgbView);
    
    
    // 按钮点击
    pushBtn.onClick(^(UIButton * sender){
        YSViewController * next = [YSViewController new];
        next.modelColor = _modelColor;
        [self.navigationController pushViewController:next animated:YES];
    });
    
    
   
    
    // 关联model到view
    [RACObserve(_modelColor, myColor) subscribeNext:^(id  _Nullable x) {
        
        rView.useSlider.value = _modelColor.rValue;
        gView.useSlider.value = _modelColor.gValue;
        bView.useSlider.value = _modelColor.bValue;
        
        rView.useText.text = [NSString stringWithFormat:@"%ld",_modelColor.rValue];
        gView.useText.text = [NSString stringWithFormat:@"%ld",_modelColor.gValue];
        bView.useText.text = [NSString stringWithFormat:@"%ld",_modelColor.bValue];
        
        NSLog(@"颜色改变了，观察了这里");
        
        colorView.bgColor(x);
    }];
    
 
    // 关联view到model
//    RACSignal *s1 = [rView.useSlider rac_signalForControlEvents:UIControlEventValueChanged];
//    RACSignal *s2 = [gView.useSlider rac_signalForControlEvents:UIControlEventValueChanged];
//    RACSignal *s3 = [bView.useSlider rac_signalForControlEvents:UIControlEventValueChanged];
//rac_channelForControlEvents

    // skip跳过的两步，第一步是创建时候的信息，第二部是观察时候发的空值。
    RACSignal *s1 = [[[rView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0] skip:2];
    RACSignal *s2 = [[[gView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0] skip:2];
    RACSignal *s3 = [[[bView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0] skip:2];

//    RACSignal *s1 = [[rView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0];
//    RACSignal *s2 = [[gView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0];
//    RACSignal *s3 = [[bView.useSlider rac_newValueChannelWithNilValue:@0] startWith:@0];

    RACSignal *s4 = [rView.useText rac_textSignal];
    RACSignal *s5 = [gView.useText rac_textSignal];
    RACSignal *s6 = [bView.useText rac_textSignal];
    
    [@[s1, s2, s3, s4, s5, s6] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"观察到这里了");
        [obj subscribeNext:^(id  _Nullable x) {
            
            NSInteger num = [x integerValue];
            switch (idx % 3) {
                    // rview
                case 0:
                    NSLog(@"观察到这里了0,%ld",num);
                    _modelColor.rValue = num;
                    break;
                    
                    // gview
                case 1:
                    NSLog(@"观察到这里了1,%ld",num);
                    _modelColor.gValue = num;
                    break;

                    // bview
                case 2:
                    NSLog(@"观察到这里了2,%ld",num);
                    _modelColor.bValue = num;
                    break;

                default:
                    break;
            }
            [_modelColor refeashColor];
        }];
    }];
    
    
    [[rView.useSlider rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        NSLog(@"这里是观察到了值的改变");
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
