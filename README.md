# cp_video_player

A customized flutter video player

## Getting Started
```dart
import 'package:cp_video_player/cp_video_player.dart';

  final CPVideoPlayerController _playerController= CPVideoPlayerController();

  @override
  void initState() {
    super.initState();
    _playerController.play("https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: MediaQuery.of(context).orientation == Orientation.portrait,
        child: CPVideoPlayer(controller: _playerController,),
      ),
    );
  }
```

