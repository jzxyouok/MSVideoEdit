// 贴纸StickerView

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
#import "CircleView.h"
#import "CommonDefine.h"

@interface StickerView : UIView

@property (copy, nonatomic) GenericCallback deleteFinishBlock;

+ (void)setActiveStickerView:(StickerView*)view;

- (id)initWithFilePath:(NSString *)path;

- (UIImageView*)imageView;
- (id)initWithImage:(UIImage *)image;
- (void)setScale:(CGFloat)scale;
- (void)setScale:(CGFloat)scaleX andScaleY:(CGFloat)scaleY;

- (void)setVideoContentRect:(CGRect)videoContent;
- (CGRect)getVideoContentRect;

- (CGRect)getInnerFrame;
- (CGFloat)getRotateAngle;
- (NSString *)getFilePath;

- (void)replayGif;

@end
