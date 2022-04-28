//
//  UIButton+HCCategory.h
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HCCategory)
- (void)hc_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;
@end

NS_ASSUME_NONNULL_END
