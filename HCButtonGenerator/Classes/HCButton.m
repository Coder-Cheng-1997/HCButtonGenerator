//
//  HCButton.m
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import "HCButton.h"
#import "HCButtonDefine.h"
#import <objc/runtime.h>

const CGFloat kDefaultLineWidth = 3.0f;
const CGFloat kButtonIconScale = 0.6f;
@interface HCButton () {
    HCButtonImagePosition _imagePosition;
    CGFloat _spacing;
    CGSize _imageResize;
    BOOL _isNeedAdjust;
}
@property (nonatomic,assign) HCButtonClickedBlock clickedBlock;
@end

@implementation HCButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self defineAction];
//        self.action = ^HCButton* {
//    //        NSLog(@"action1被调用了,btn内存地址：%p",btn);
//    //        HCButton *btn1 = objc_getAssociatedObject(self, hcBtn);
//            return self;
//        };
//        if (self.action) {
//            self.action();
//        }
    }
    return self;
}

+ (instancetype)buttonWithIconType:(HCIconType)iconType {
    HCButton *btn = [HCButton buttonWithType:UIButtonTypeCustom];
    btn.iconType = iconType;
    return btn;
}

- (void)defineAction {
//    HCWeakSelf
//    self.action = ^HCButton * _Nonnull {
//        HCStrongSelf
//        NSLog(@"action被调用了");
////        strongSelf.clickedBlock = actionBlock;
//        return strongSelf;
//    };
}

- (void)imagePosition:(HCButtonImagePosition)postion spacing:(CGFloat)spacing {
    _imagePosition = postion;
    _spacing = spacing;
    _isNeedAdjust = YES;
//    [self adjustImagePosition:_imagePosition spacing:_spacing];
    [self setNeedsLayout];
    
}

- (void)imagePosition:(HCButtonImagePosition)postion spacing:(CGFloat)spacing imageViewSize:(CGSize)size {
    _imagePosition = postion;
    _spacing = spacing;
    _imageResize = size;
    _isNeedAdjust = YES;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_isNeedAdjust) {
        if (_spacing < 4)_spacing = 4;
        if (CGSizeEqualToSize(CGSizeZero, _imageResize))_imageResize = self.imageView.frame.size;
        [self adjustImagePosition:_imagePosition spacing:_spacing];
    }
}

- (void)adjustImagePosition:(HCButtonImagePosition)position spacing:(CGFloat)spacing {
    //图片大小
    CGSize imageSize = _imageResize;
    //标题大小
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    //总宽度：图片宽度+标题宽度+间隔宽度
    CGFloat totalWidth = imageSize.width + titleSize.width + spacing;
    //总宽度：图片高度+标题高度+间隔高度
    CGFloat totalHeight = imageSize.height + titleSize.height + spacing;
    
    //按钮高度
    CGFloat btnHeight = self.bounds.size.height;
    //按钮宽度
    CGFloat btnWidth = self.bounds.size.width;
    
    CGFloat imageX = 0,imageY = 0;
    CGFloat titleX = 0,titleY = 0;
    
    switch (position) {
        case HCButtonImagePositionLeft:
            imageX = (btnWidth - totalWidth)/2;
            imageY = (btnHeight - imageSize.height)/2;
            titleX = imageX + imageSize.width + spacing;
            titleY = (btnHeight - titleSize.height)/2;
            break;
        case HCButtonImagePositionRight:
        {
            titleX = (btnWidth - totalWidth)/2;
            titleY = (btnHeight - titleSize.height)/2;
            imageX = titleX + titleSize.width + spacing;
            imageY = (btnHeight - imageSize.height)/2;
        }

            break;
        case HCButtonImagePositionTop:
            imageY = (btnHeight - totalHeight)/2;
            imageX = (btnWidth - imageSize.width)/2;
            titleY = imageY + imageSize.height + spacing;
            titleX = (btnWidth - titleSize.width)/2;
            break;
        case HCButtonImagePositionBottom:
            titleY = (btnHeight - totalHeight)/2;
            titleX = (btnWidth - titleSize.width)/2;
            imageY = titleY + titleSize.height + spacing;
            imageX = (btnWidth - imageSize.width)/2;
            break;
        case HCButtonImagePositionUndefined:
            titleX = self.titleLabel.frame.origin.x;
            titleY = self.titleLabel.frame.origin.y;
            imageX = (btnWidth - imageSize.width)/2;
            imageY = (btnHeight - imageSize.height)/2;
            break;
    }
    self.imageView.frame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
}

- (void)handlerClickedEvent:(HCButton*)btn {
    if (self && _actionBlock) {
        _actionBlock(btn);
    }
}

- (void)drawRect:(CGRect)rect {

    if (_iconType == HCIconTypePlus || _iconType == HCIconTypeMinus) {
        UIBezierPath *bGpath = [UIBezierPath bezierPathWithOvalInRect:rect];
        [(_iconBgColor?_iconBgColor:UIColor.systemBlueColor) setFill];
        [bGpath fill];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = _iconLineWidth ? _iconLineWidth: kDefaultLineWidth;
        
        CGFloat plusWidth = MIN(rect.size.width, rect.size.height)*kButtonIconScale;
        
        CGPoint startPointH = CGPointMake((CGRectGetWidth(rect)-plusWidth)/2, CGRectGetHeight(rect)/2);
        CGPoint endPointH = CGPointMake(startPointH.x+plusWidth, CGRectGetHeight(rect)/2);
        [path moveToPoint:startPointH];
        [path addLineToPoint:endPointH];
       
        if (_iconType == HCIconTypePlus) {
            CGPoint startPointV = CGPointMake( CGRectGetWidth(rect)/2,(CGRectGetHeight(rect)-plusWidth)/2);
            CGPoint endPointV = CGPointMake( CGRectGetWidth(rect)/2,startPointV.y+plusWidth);
            [path moveToPoint:startPointV];
            [path addLineToPoint:endPointV];
        }
        
        [(_iconColor?_iconColor:UIColor.whiteColor) setStroke];
        [path stroke];
    } else {
        [super drawRect:rect];
    }
    
    
}
@end
