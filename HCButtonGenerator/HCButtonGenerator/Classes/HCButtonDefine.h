//
//  HCButtonDefine.h
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#ifndef HCButtonDefine_h
#define HCButtonDefine_h
#import "UIButton+HCCategory.h"
#import "NSMutableDictionary+HCCategory.h"
/*样式默认值*/
#define hc_defaultBackgroundColor [UIColor whiteColor]
#define hc_defaultTitleColor [UIColor blueColor]
#define hc_defaultCornerRadius @10
#define hc_clearColor [UIColor clearColor]
#define hc_systemBlueColor [UIColor systemBlueColor]
#define hc_whiteColor [UIColor whiteColor]
#define hc_lineWidth @1

// 弱引用
#define HCWeakSelf __weak typeof(self) weakSelf = self;
// 强引用
#define HCStrongSelf __strong typeof(weakSelf) strongSelf = weakSelf;

#endif /* HCButtonDefine_h */
