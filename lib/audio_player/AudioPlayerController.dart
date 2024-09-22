import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class AudioPlayerController extends GetxController{


  static MethodChannel methodChannel = const MethodChannel('audioChannal');


  final showToast = methodChannel.invokeMethod('show_toast');

  RxBool playButton = true.obs;

  double progress = 0.0;

  var isPlaying = false.obs;
  var currentAudio = ''.obs;


  Future<void> playAudio(String assetPath) async {
    try {
      final result = await methodChannel.invokeMethod('playAudio', assetPath);
      isPlaying.value = result == 'audioPlayed';
      currentAudio.value = assetPath;
    } on PlatformException catch (e) {
      print("Failed to play audio: '${e.message}'.");
    }
  }

  Future<void> pauseAudio() async {
    try {
      await methodChannel.invokeMethod('audioStop');
      isPlaying.value = false;
    } on PlatformException catch (e) {
      print("Failed to pause audio: '${e.message}'.");
    }
  }

}