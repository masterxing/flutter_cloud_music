import 'package:flutter_cloud_music/common/model/song_model.dart';
import 'package:flutter_cloud_music/common/player/player_service.dart';
import 'package:get/get.dart';

class PlayingController extends GetxController {
  final curPlaying = Rx<Song?>(PlayerService.to.curPlay.value);

  final showNeedle = false.obs;
  @override
  void onInit() {
    super.onInit();
    PlayerService.to.player.addListener(_checkCurPlayStatus);
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      showNeedle.value = true;
    });
  }

  @override
  void onClose() {
    PlayerService.to.player.removeListener(_checkCurPlayStatus);
  }

  void _checkCurPlayStatus() {
    if (PlayerService.to.curPlayId.value != curPlaying.value?.id) {
      //不是同一首
      curPlaying.value = PlayerService.to.curPlay.value;
    }
  }
}
