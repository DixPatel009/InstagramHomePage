import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/svg_icon.dart';

class ImageWidget extends StatelessWidget {
  final String? path;
  final BoxFit fit;
  final String? thumb;
  final bool videoIconBig;

  const ImageWidget({
    required this.path,
    required this.fit,
    this.thumb,
    this.videoIconBig = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path == "" || path == null) {
      return Container(
        color: Colors.transparent,
      );
    }
    if (path!.contains(".svg")) {
      return SvgIcon(
        path: path!,
        fit: BoxFit.contain,
      );
    } else {
      return CachedNetworkImage(
        placeholder: (context, url) => thumb == null
            ? Container()
            : path == thumb
                ? Container()
                : CachedNetworkImage(
                    imageUrl: thumb!,
                    fit: fit,
                    errorWidget: (context, error, value) {
                      return Container(
                        color: Colors.transparent,
                      );
                    },
                  ),
        fit: fit,
        imageUrl: path!,
        errorWidget: (context, error, value) {
          return Container(
            color: Colors.transparent,
          );
        },
      );
    }
  }
}
