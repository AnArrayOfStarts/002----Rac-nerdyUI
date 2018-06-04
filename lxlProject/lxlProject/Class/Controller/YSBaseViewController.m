//
//  YSBaseViewController.m
//  lxlProject
//
//  Created by 李晓龙 on 2018/3/26.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSBaseViewController.h"

// 获得导航栏高度
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height


@interface YSBaseViewController ()

@end

@implementation YSBaseViewController
{
    UILabel *rLabel;
    UILabel *gLabel;
    UILabel *bLabel;
    UISlider *rSlider;
    UISlider *gSlider;
    UISlider *bSlider;
    UITextField *rText;
    UITextField *gText;
    UITextField *bText;
    UIView *rView;
    UIView *gView;
    UIView *bView;
    UIView *rgbView;
    
    UIView *colorView;
    UIView *rootView;
    UIButton *pushBtn;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"颜色测试";
    self.view.backgroundColor = [UIColor whiteColor];
 
    // 我的方法
    /*
    // 布局上面的rgb控制view
    
    rgbView = View.embedIn(self.view,getRectNavAndStatusHight,0,0,0);

    //rView = View.embedIn(rgbView,0,0,rgbView.frame.size.height/3,0).border(1,@"black");
    rLabel = Label.str(@"R").fnt(@17);
    rSlider = Slider.maxVal(255).minVal(0).val(0);
    rText = TextField.str(@"0").border(1,@"gray").maxLength(3).fixWidth(50).borderRadius(4).centerAlignment.numberKeyboard;

    
    //gView = View.embedIn(rgbView,rgbView.frame.size.height/3,0,rgbView.frame.size.height/3,0);
    gLabel = Label.str(@"G").fnt(@17);
    gSlider = Slider.maxVal(255).minVal(0).val(0);
    gText = TextField.str(@"0").border(1,@"gray").maxLength(3).fixWidth(50).borderRadius(4).centerAlignment.numberKeyboard;

    
    //bView = View.embedIn(rgbView,rgbView.h/3*2,0,0,0);
    bLabel = Label.str(@"B").fnt(@17);
    bSlider = Slider.maxVal(255).minVal(0).val(0);
    bText = TextField.str(@"0").border(1,@"gray").maxLength(3).fixWidth(50).borderRadius(4).centerAlignment.numberKeyboard;
   
    colorView = View.bgColor(@"yellow").border(1,@"green").fixHeight(100).borderRadius(50);
    
    pushBtn = Button.str(@"push").border(1).borderRadius(4);

    
    // 横向布局
    id rStack = HorStack(@10,rLabel,rSlider,rText,NERSpring).gap(10);
    id gStack = HorStack(@10,gLabel,gSlider,gText,NERSpring).gap(10);
    id bStack = HorStack(@10,bLabel,bSlider,bText,NERSpring).gap(10);
    

    id rgbStack = VerStack(@30,
                           rStack,
                           gStack,
                           bStack,
                           colorView,
                           HorStack(@(Screen.width/2),pushBtn),
                           NERSpring
                           ).gap(30).embedIn(rgbView);

    
    // push按钮
    //[pushBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    
    [[pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        YSBaseViewController * base = [YSBaseViewController new];
        [self.navigationController pushViewController:base animated:YES];
        
        //NSLog(@"%@ 按钮被点击了", x); // x 是 button 按钮对象
    }];
    
    
    // rac监听
    [[rSlider rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(__kindof UISlider * _Nullable x) {
        // rText.text = [NSString stringWithFormat:@"%0.0f",x];
        NSLog(@"====%0.0f",x.value);
        NSLog(@"$$$$%0.0f",rSlider.value);
    }];
    
    //RAC(_loginButton, enabled) = [RACSignal combineLatest:@[_username.rac_textSignal, _password.rac_textSignal] reduce:^id _Nullable(NSString * username, NSString * password){
        
    //    return @(username.length && password.length);
    //}];
    
    
    RACSignal * rSignal = [rSlider rac_signalForControlEvents:UIControlEventValueChanged];
    RACSignal * gSignal = [gSlider rac_signalForControlEvents:UIControlEventValueChanged];
    RACSignal * bSignal = [bSlider rac_signalForControlEvents:UIControlEventValueChanged];
    
    RAC(colorView, backgroundColor) = [RACSignal combineLatest:@[rSignal,gSignal,bSignal] reduce:^id _Nonnull{
        return [UIColor greenColor];
    }];

    //[RACSignal ]
    
     */
}


-(void)push:(id)sender
{
    // NSLog(@"you got me");
    
    YSBaseViewController * base = [YSBaseViewController new];
    [self.navigationController pushViewController:base animated:YES];
    
    
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
