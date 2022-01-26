import 'package:cp_video_player/cp_video_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlayerTestPage(),
    );
  }
}


class PlayerTestPage extends StatefulWidget {
  const PlayerTestPage({Key? key}) : super(key: key);

  @override
  _PlayerTestPageState createState() => _PlayerTestPageState();
}
class _PlayerTestPageState extends State<PlayerTestPage> {
  final CPVideoPlayerController _playerController= CPVideoPlayerController();

  @override
  void initState() {
    super.initState();

    _playerController.interceptSeekTo = canSeek;
    _playerController.onProgressChange = onProgressChanged;
    Future.delayed(const Duration(seconds: 3)).whenComplete((){
      _playerController.play("https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent
    ));
    return Scaffold(
      body: SafeArea(
        top: MediaQuery.of(context).orientation == Orientation.portrait,
        child: Column(
          children: [
            CPVideoPlayer(controller: _playerController,),
            const Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 500,width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double canSeek(double seekPosition, double totalDuration) {
    return seekPosition < totalDuration * 0.75 ? seekPosition : totalDuration * 0.75;
  }

  void onProgressChanged(double playedPosition, double totalDuration) {
    print("ProgressChanged: $playedPosition / $totalDuration");
  }
}