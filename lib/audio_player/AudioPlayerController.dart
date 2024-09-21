import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AudioPlayerController extends GetxController{


  RxBool playButton = false.obs;

  double progress = 0.0;
}