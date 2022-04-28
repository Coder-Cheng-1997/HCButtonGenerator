//
//  HCVariousButtonsGenerator.m
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import "HCButtonGenerator.h"
/*系统*/
#import <UIKit/UILabel.h>
#import <UIKit/NSAttributedString.h>
#import <objc/runtime.h>
/*自定义*/
#import "HCButtonDefine.h"

/*按钮定制样式*/
HCButtonStyleKey const HCButtonBackgroundColor = @"HCButtonBackgroundColor";
HCButtonStyleKey const HCButtonTitleColor = @"HCButtonTitleColor";
HCButtonStyleKey const HCButtonCornerRadius = @"HCButtonCornerRadius";
HCButtonStyleKey const HCButtonBorderWdith = @"HCButtonBorderWdith";
HCButtonStyleKey const HCButtonBorderColor = @"HCButtonBorderColor";
/*iconStyle*/
HCButtonStyleKey const HCIconBgColor = @"HCIconBgColor";
HCButtonStyleKey const HCIconColor = @"HCIconColor";
HCButtonStyleKey const HCIconLineWidth = @"HCIconLineWidth";

@implementation HCButtonGenerator
/**
 单例
 */
+ (instancetype)generator {
    static HCButtonGenerator *generator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        generator = [[self.class alloc]init];
    });
    return generator;
}
/*按钮生成方法 - 仅包含标题*/
- (HCButton *)generateButtonWithTitle:(NSString*)title buttonType:(HCButtonType)buttonType {
   return [self generateButtonWithTitle:title buttonType:buttonType style:nil];
}

- (HCButton *)generateButtonWithTitle:(NSString*)title  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style {
    return [self generateButtonWithTitle:title buttonType:HCButtonTypeDefault style:style];
}

- (HCButton *)generateButtonWithTitle:(NSString*)title buttonType:(HCButtonType)buttonType style:(nullable NSDictionary<HCButtonStyleKey,id>*)style {
    
    HCButton *btn = [self generateButton];
    
    NSMutableDictionary *mutableStyle = style?[style mutableCopy]:[NSMutableDictionary dictionary];
    if (buttonType == HCButtonTypeOne) {
    } else if (buttonType == HCButtonTypeTwo) {
        [mutableStyle addEntriesFromDictionaryIfAbsent:@{
            HCButtonCornerRadius:hc_defaultCornerRadius,
            HCButtonBackgroundColor:hc_systemBlueColor,
            HCButtonTitleColor:hc_whiteColor
        }];
    } else if (buttonType == HCButtonTypeThree) {
        [mutableStyle addEntriesFromDictionaryIfAbsent:@{
            HCButtonCornerRadius:hc_defaultCornerRadius,
            HCButtonBackgroundColor:hc_whiteColor,
            HCButtonTitleColor:hc_systemBlueColor,
            HCButtonBorderWdith:hc_lineWidth,
            HCButtonBorderColor:hc_systemBlueColor
        }];
    }
    
    style = [mutableStyle copy];
    [self setTitle:title style:style forButton:btn];
    
    return btn;
}

/*按钮生成方法 - 仅包含图片*/
- (HCButton *)generateButtonWithImage:(UIImage*)image buttonType:(HCButtonType)buttonType {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:CGSizeZero buttonType:buttonType style:nil];
}
- (HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:imageResize buttonType:buttonType style:nil];
}
- (HCButton *)generateButtonWithImage:(UIImage*)image  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:CGSizeZero buttonType:HCButtonTypeDefault style:nil];
}
- (HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageResize  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:imageResize buttonType:HCButtonTypeDefault style:nil];
}
- (HCButton *)generateButtonWithImage:(UIImage*)image buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:CGSizeZero buttonType:HCButtonTypeDefault style:style];
}
- (HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style {
    return [self generateButtonWithTitle:@"" image:image imagePosition:HCButtonImagePositionUndefined imageResize:imageResize buttonType:HCButtonTypeDefault style:style];
}
/*按钮生成方法 - 包含图片和标题*/
- (HCButton *)generateButtonWithTitle:(NSString *)title image:(UIImage *)image imagePosition:(HCButtonImagePosition)imagePosition buttonType:(HCButtonType)buttonType {
    return [self generateButtonWithTitle:title image:image imagePosition:imagePosition imageResize:CGSizeZero buttonType:buttonType style:nil];
}

- (HCButton *)generateButtonWithTitle:(NSString *)title image:(UIImage *)image imagePosition:(HCButtonImagePosition)imagePosition buttonType:(HCButtonType)buttonType style:(nullable NSDictionary<HCButtonStyleKey,id> *)style{
    return [self generateButtonWithTitle:title image:image imagePosition:HCButtonImagePositionLeft imageResize:CGSizeZero buttonType:buttonType style:style];
}

- (HCButton *)generateButtonWithTitle:(NSString *)title image:(UIImage *)image imagePosition:(HCButtonImagePosition)imagePosition imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType {
    return [self generateButtonWithTitle:title image:image imagePosition:HCButtonImagePositionLeft imageResize:imageResize buttonType:buttonType style:nil];
}

- (HCButton *)generateButtonWithTitle:(NSString *)title image:(UIImage *)image imagePosition:(HCButtonImagePosition)imagePosition imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType style:(nullable NSDictionary<HCButtonStyleKey,id> *)style{
    HCButton *btn =  [self generateButtonWithTitle:title buttonType:buttonType style:style];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        if (!CGSizeEqualToSize(CGSizeZero, imageResize)) {
            btn.imageView.contentMode = UIViewContentModeScaleToFill;
        }
        [btn imagePosition:imagePosition spacing:0.0f imageViewSize:imageResize];
        
    }
    return btn;
}
static void* hcBtn = &hcBtn;
- (HCButton*)generateButton {
    HCButton *btn = [HCButton buttonWithType:UIButtonTypeCustom];
//    objc_setAssociatedObject(self, hcBtn, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return btn;
}

- (void)setTitle:(NSString*)title style:(NSDictionary<HCButtonStyleKey,id>*)style forButton:(HCButton*)btn {
    UIColor *bgColor = [style valueForKey:HCButtonBackgroundColor];
    UIColor *titleColor = [style valueForKey:HCButtonTitleColor];
    NSNumber *cornerRadius = [style valueForKey:HCButtonCornerRadius];
    NSNumber *borderWidth = [style valueForKey:HCButtonBorderWdith];
    UIColor *borderColor = [style valueForKey:HCButtonBorderColor];
    btn.backgroundColor = bgColor?bgColor:hc_defaultBackgroundColor;
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName:titleColor?titleColor:hc_defaultTitleColor
    };
    if (title && ![title isEqualToString:@""]) {
        NSAttributedString *attributedTitle = [[NSAttributedString alloc]initWithString:title attributes:attributes];
        [btn setAttributedTitle:attributedTitle forState:UIControlStateNormal];
    } else {
        btn.imageView.contentMode = UIViewContentModeCenter;
    }
    btn.layer.borderWidth = borderWidth.floatValue;
    btn.layer.borderColor = borderColor.CGColor;
    [btn hc_radiusWithRadius:cornerRadius.floatValue corner:UIRectCornerAllCorners];
//    btn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [btn addTarget:btn action:NSSelectorFromString(@"handlerClickedEvent:") forControlEvents:UIControlEventTouchUpInside];

    //    __weak typeof(btn) weakBtn = btn;
    //    btn.action = ^HCButton * _Nonnull{
    //        __strong typeof(btn) strongBtn = weakBtn;
    //        return strongBtn;
    //    };
}
/*自定义绘制方法*/
- (HCButton *)generateIconButton:(HCIconType)iconType {
    return [HCButton buttonWithIconType:iconType];
}

- (HCButton *)generateIconButton:(HCIconType)iconType style:(NSDictionary<HCButtonStyleKey,id> *)style {
    HCButton *btn = [HCButton buttonWithIconType:iconType];
    if (style) {
       UIColor *bgColor = [style valueForKey:HCIconBgColor];
       UIColor *iconColor = [style valueForKey:HCIconColor];
       NSNumber *iconLineWidth = [style valueForKey:HCIconLineWidth];
        btn.iconBgColor = bgColor;
        btn.iconColor = iconColor;
        btn.iconLineWidth = iconLineWidth.floatValue;
    }
    return btn;
}
@end
