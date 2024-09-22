import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/flutterToast.dart';
import 'AudioPlayerController.dart';

class AudioPlayerScreen extends StatefulWidget {
  AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final playerControler = Get.put(AudioPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        SizedBox(
          height: Get.height * 0.5,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(
              value: playerControler.progress,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 100,
                  icon: const Icon(
                    Icons.fast_rewind_rounded,
                  ),
                  onPressed: () {
                    toastMessage("this functionality is pending");
                  },
                ),
                Obx(
                  () => IconButton(
                    iconSize: 100,
                    icon: Icon(
                      (playerControler.playButton.value == true)
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (playerControler.playButton!.value = false) {
                        playerControler.playButton.value == true;

                        playerControler.playAudio(
                            'assets/audios/creative-technology-showreel-241274.mp3');
                      } else {
                        playerControler.playButton.value == false;

                        playerControler.pauseAudio();
                      }
                    },
                  ),
                ),
                IconButton(
                  iconSize: 100,
                  icon: const Icon(
                    Icons.fast_forward_rounded,
                  ),
                  onPressed: () {
                    toastMessage("this functionality is pending");
                  },
                )
              ],
            ),
          ],
        ),
      ]),
    ));
  }
}
