//
//  HCButton.h
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import <UIKit/UIKit.h>
@class HCButton;
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,HCButtonImagePosition) {
    HCButtonImagePositionUndefined = -1,
    HCButtonImagePositionLeft = 0,
    HCButtonImagePositionRight,
    HCButtonImagePositionTop,
    HCButtonImagePositionBottom
};
typedef NS_ENUM(NSInteger,HCIconType) {
    HCIconTypeUndefined = 0,
    HCIconTypePlus,
    HCIconTypeMinus,
};
typedef void(^HCButtonClickedBlock)(HCButton*btn);
@interface HCButton : UIButton
@property (nonatomic,assign) HCIconType iconType;
@property (nonatomic,assign) CGFloat iconLineWidth;
@property (nonatomic,assign) UIColor *iconColor;
@property (nonatomic,assign) UIColor *iconBgColor;
@property (nonatomic,assign) HCButton*(^action)(void);
@property (nonatomic,assign) void(^actionBlock)(HCButton*btn);

+(instancetype)buttonWithIconType:(HCIconType)iconType;
-(void)imagePosition:(HCButtonImagePosition)postion spacing:(CGFloat)spacing;
-(void)imagePosition:(HCButtonImagePosition)postion spacing:(CGFloat)spacing imageViewSize:(CGSize)size;
-(void)handlerClickedEvent:(HCButton*)btn;

@end

NS_ASSUME_NONNULL_END
