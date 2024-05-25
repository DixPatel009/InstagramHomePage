import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intagramhome/classes/post.dart';
import 'package:intagramhome/modules/home/provider/media_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/svg_icon.dart';

class CustomVideoPlayer extends StatefulWidget {
  Post post;

  CustomVideoPlayer({
    required this.post,
    super.key,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  BuildContext? buildContextMediaProvider;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.post.userPost),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
    )..initialize().then((value) {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MediaPlayerProvider(),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Consumer<MediaPlayerProvider>(
              builder: (context, mediaPlayerProvider, child) {
                buildContextMediaProvider = context;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    VisibilityDetector(
                      key: Key(widget.post.postAddedDate.toString()),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (mounted) {
                          if (info.visibleFraction == 1) {
                            _videoPlayerController?.play();
                            Provider.of<MediaPlayerProvider>(
                              buildContextMediaProvider!,
                              listen: false,
                            ).setMediaPlayerState(true);
                          } else {
                            _videoPlayerController?.pause();
                            Provider.of<MediaPlayerProvider>(
                              buildContextMediaProvider!,
                              listen: false,
                            ).setMediaPlayerState(false);
                          }
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController?.value.aspectRatio ?? 1,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          if (!mediaPlayerProvider.isPlay) {
                            _videoPlayerController?.play();
                            Provider.of<MediaPlayerProvider>(
                              buildContextMediaProvider!,
                              listen: false,
                            ).setMediaPlayerState(true);
                          } else {
                            _videoPlayerController?.pause();
                            Provider.of<MediaPlayerProvider>(
                              buildContextMediaProvider!,
                              listen: false,
                            ).setMediaPlayerState(false);
                          }
                        },
                        child: SvgIcon(
                          size: 36,
                          path: mediaPlayerProvider.isPlay ? "assets/icons/svg/ic_pause_circle.svg" : "assets/icons/svg/ic_play_circle.svg",
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }
}

class VideoController {
  VideoController({
    required this.loading,
    required this.loaded,
    required this.completed,
    this.fail,
  });

  Function loading;
  Function(VideoPlayerController controller, File? file) loaded;
  Function(VideoPlayerController controller) completed;
  Function? fail;
}
