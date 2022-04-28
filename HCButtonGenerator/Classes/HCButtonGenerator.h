//
//  HCVariousButtonsGenerator.h
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import <Foundation/Foundation.h>
#import "HCButton.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSString * HCButtonStyleKey NS_TYPED_EXTENSIBLE_ENUM;
extern  HCButtonStyleKey const HCButtonBackgroundColor;
extern  HCButtonStyleKey const HCButtonTitleColor;
extern  HCButtonStyleKey const HCButtonCornerRadius;
extern  HCButtonStyleKey const HCButtonBorderWdith;
extern  HCButtonStyleKey const HCButtonBorderColor;
/*iconStyle*/
extern  HCButtonStyleKey const HCIconBgColor;
extern  HCButtonStyleKey const HCIconColor;
extern  HCButtonStyleKey const HCIconLineWidth;
typedef NS_ENUM(NSInteger,HCButtonType) {
    HCButtonTypeDefault,
    HCButtonTypeOne,//透明背景按钮
    HCButtonTypeTwo,//圆角实心按钮
    HCButtonTypeThree,//圆角边框按钮
};

@interface HCButtonGenerator : NSObject
@property (class,nonatomic,readonly,strong) HCButtonGenerator *generator;
/*构造方法*/
+(instancetype)generator;
/*按钮生成方法 -仅包含标题*/
-(HCButton *)generateButtonWithTitle:(NSString*)title buttonType:(HCButtonType)buttonType;
-(HCButton *)generateButtonWithTitle:(NSString*)title  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
-(HCButton *)generateButtonWithTitle:(NSString*)title buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
/*按钮生成方法 -仅包含图片*/
-(HCButton *)generateButtonWithImage:(UIImage*)image buttonType:(HCButtonType)buttonType;
-(HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageSize buttonType:(HCButtonType)buttonType;
-(HCButton *)generateButtonWithImage:(UIImage*)image  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
-(HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageSize  style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
-(HCButton *)generateButtonWithImage:(UIImage*)image buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
-(HCButton *)generateButtonWithImage:(UIImage*)image imageResize:(CGSize)imageSize buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
/*按钮生成方法 -包含标题和图片*/
-(HCButton *)generateButtonWithTitle:(NSString*)title image:(UIImage*)image imagePosition:( HCButtonImagePosition)imagePosition buttonType:(HCButtonType)buttonType;
-(HCButton *)generateButtonWithTitle:(NSString*)title image:(UIImage*)image imagePosition:( HCButtonImagePosition)imagePosition buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
-(HCButton *)generateButtonWithTitle:(NSString*)title image:(UIImage*)image imagePosition:(HCButtonImagePosition)imagePosition imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType;
-(HCButton*)generateButtonWithTitle:(NSString*)title image:(UIImage*)image imagePosition:(HCButtonImagePosition)imagePosition imageResize:(CGSize)imageResize buttonType:(HCButtonType)buttonType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
/*自定义绘制*/
-(HCButton*)generateIconButton:(HCIconType)iconType;
-(HCButton*)generateIconButton:(HCIconType)iconType style:(nullable NSDictionary< HCButtonStyleKey ,id>*)style;
@end

NS_ASSUME_NONNULL_END
