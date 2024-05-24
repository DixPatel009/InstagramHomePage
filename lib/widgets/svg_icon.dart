import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String path;
  final double size;
  final BoxFit fit;
  final Color? color;

  const SvgIcon({
    required this.path,
    this.fit = BoxFit.contain,
    this.size = 20,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (path == '') {
      return SizedBox(
        width: size,
        height: size,
      );
    }
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      fit: fit,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}
