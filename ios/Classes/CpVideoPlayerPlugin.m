#import "CpVideoPlayerPlugin.h"
#if __has_include(<cp_video_player/cp_video_player-Swift.h>)
#import <cp_video_player/cp_video_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cp_video_player-Swift.h"
#endif

@implementation CpVideoPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCpVideoPlayerPlugin registerWithRegistrar:registrar];
}
@end
