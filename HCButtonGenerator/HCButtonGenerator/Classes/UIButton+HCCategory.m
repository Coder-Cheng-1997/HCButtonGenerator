//
//  UIButton+HCCategory.m
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import "UIButton+HCCategory.h"

@implementation UIButton (HCCategory)
- (void)hc_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner {
    //某些旧的xocde版本没有某些API，通过#ifdef即可避免再新旧xcode切换时频繁注释掉代码
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.layer.cornerRadius = radius;
        self.layer.maskedCorners = (CACornerMask)corner;
#else
    if ((NO)) {
#endif
    } else {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}
@end
