
#import "ScrollSelectView.h"
#import "CommonDefine.h"

static NSMutableDictionary *filenameDic;

#define ContentHeight 50

@interface ScrollSelectView()

@property (nonatomic, strong) UIButton *selectedViewBtn;

@end

@implementation ScrollSelectView

#pragma mark - GIF
- (id)initWithFrameFromGif:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization
        [self initResourceFormGif];
    }
    return self;
}

- (void)initResourceFormGif
{
    
    _ContentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), ContentHeight)];
    [_ContentView setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.6]];
    _ContentView.showsHorizontalScrollIndicator = NO;
    _ContentView.showsVerticalScrollIndicator = NO;
    [self addSubview:_ContentView];
    
    // Get files count from resource
    NSString *filename = @"Theme";
    NSArray *fileList = [filenameDic objectForKey:filename];
    NSLog(@"fileList: %@, Count: %lu", fileList, (unsigned long)[fileList count]);
    
    unsigned long gifCount = [fileList count];
    CGFloat width = 116/2.0f;
    CGFloat height = 100/2.0f;
    for (int i = 0; i < gifCount; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width+(width-37)/2.0f, 2.5f, 45, 45)];
        
        NSString *name = [NSString stringWithFormat:@"Theme_%i.gif", i+1];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [button setImage:img forState:UIControlStateNormal];
        
        UIEdgeInsets insets = {3, 3, 3, 3};
        [button setImageEdgeInsets:insets];
        
        [button setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(gifAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i+1];
        [_ContentView addSubview:button];
        
        if (i == 0)
        {
            [button setSelected:YES];
            _selectedViewBtn = button;
        }
    }
    
    [_ContentView setContentSize:CGSizeMake(gifCount*width, height)];
}

- (void)gifAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button == _selectedViewBtn)
    {
        return;
    }
    
    self.selectStyleIndex = button.tag;
    [_selectedViewBtn setSelected:NO];
    _selectedViewBtn = button;
    [_selectedViewBtn setSelected:YES];
    
    if (_delegateSelect && [_delegateSelect respondsToSelector:@selector(didSelectedGifIndex:)])
    {
        [_delegateSelect didSelectedGifIndex:self.selectStyleIndex];
    }
}

#pragma mark - GetDefaultFilelist 获取系统默认提供的 GIF文件列表
+ (void)getDefaultFilelist
{
    NSString *name = @"Theme_1", *type = @"gif";
    NSString *fileFullPath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSString *filePathWithoutName = [fileFullPath stringByDeletingLastPathComponent];
    NSString *fileName = [fileFullPath lastPathComponent];
    NSString *fileExt = [fileFullPath pathExtension];
    NSLog(@"filePathWithoutName: %@, fileName: %@, fileExt: %@", filePathWithoutName, fileName, fileExt);
    
    NSString *filenameByGif = @"Theme";
    filenameDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [filenameDic setObject:getFilelistBySymbol(filenameByGif, filePathWithoutName, type) forKey:filenameByGif];
}
@end
