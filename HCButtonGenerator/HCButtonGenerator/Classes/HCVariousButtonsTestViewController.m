//
//  HCVariousButtonsTestViewController.m
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import "HCVariousButtonsTestViewController.h"
#import "HCButtonGenerator.h"
@interface HCVariousButtonsTestViewController ()

@end

@implementation HCVariousButtonsTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //白色背景颜色
    self.view.backgroundColor = UIColor.whiteColor;
    //透明背景无边按钮
//    HCButton *btn = [HCButtonGenerator.generator generateButtonWithTitle:@"按钮2" buttonType:HCButtonTypeThree style:@{HCButtonCornerRadius:@10.f}];
//    HCButton *btn = [HCButtonGenerator.generator generateButtonWithTitle:@"图片按钮" image:[UIImage imageNamed:@"camera_overturn"] imagePosition:HCButtonImagePositionBottom imageResize:CGSizeMake(40, 40)  buttonType:HCButtonTypeThree];
//    HCButton *btn = [HCButtonGenerator.generator generateButtonWithImage:[UIImage imageNamed:@"camera_overturn"] imageResize:CGSizeMake(80, 80) buttonType:HCButtonTypeThree];
    HCButton *btn = [HCButtonGenerator.generator generateIconButton:HCIconTypePlus style:@{HCIconBgColor:UIColor.darkTextColor}];
    btn.actionBlock = ^(HCButton * _Nonnull btn) {
        NSLog(@"actionBlock被点击了");
    };
//    btn.action = ^HCButton * _Nonnull{
//        NSLog(@"action被调用了");
//        return btn;
//    };
    
//    if (btn.action) {
//        btn.action();
//    }
    btn.frame = CGRectMake(self.view.center.x - 30, self.view.center.y - 30, 60, 60);
    [self.view addSubview:btn];
}



@end
