import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cp_video_player/cp_video_player.dart';

void main() {
  const MethodChannel channel = MethodChannel('cp_video_player');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
