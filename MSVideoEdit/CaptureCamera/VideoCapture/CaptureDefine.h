
#define DEVICE_BOUNDS [[UIScreen mainScreen] applicationFrame]
#define DEVICE_SIZE [[UIScreen mainScreen] applicationFrame].size
#define DEVICE_OS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define DELTA_Y (DEVICE_OS_VERSION >= 7.0f? 20.0f : 0.0f)

#define color(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define VIDEO_FOLDER @"Videos"

#define MIN_VIDEO_DUR 3.0f   // 短视频录制的最短时间限制为3妙
#define MAX_VIDEO_DUR 15.0f  // 短视频录制的最长时间限制为15秒
