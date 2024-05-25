import 'package:intagramhome/utils/base_provider.dart';

class MediaPlayerProvider extends BaseProvider {
  bool isPlay = false;

  setMediaPlayerState(bool isPlay) {
    this.isPlay = isPlay;
    notifyListeners();
  }
}
