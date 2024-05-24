import 'package:flutter/material.dart';

enum AppTextStyle {
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  headLineLarge,
}

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final AppTextStyle style;
  final int maxLines;
  final TextAlign align;
  final FontWeight? weight;
  final TextDecoration decoration;

  const NormalText({
    required this.text,
    required this.color,
    required this.style,
    this.maxLines = 1,
    this.align = TextAlign.start,
    this.weight,
    this.decoration = TextDecoration.none,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle(context, style, weight).copyWith(
        color: color,
        decoration: decoration,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: align,
    );
  }
}

TextStyle textStyle(
  BuildContext context,
  AppTextStyle style,
  FontWeight? weight,
) {
  switch (style) {
    case AppTextStyle.titleLarge:
      if (weight != null) {
        return Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.titleLarge!;
    case AppTextStyle.titleMedium:
      if (weight != null) {
        return Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.titleMedium!;
    case AppTextStyle.titleSmall:
      if (weight != null) {
        return Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.titleSmall!;
    case AppTextStyle.bodyLarge:
      if (weight != null) {
        return Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.bodyLarge!;
    case AppTextStyle.bodyMedium:
      if (weight != null) {
        return Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.bodyMedium!;
    case AppTextStyle.bodySmall:
      if (weight != null) {
        return Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.bodySmall!;
    case AppTextStyle.labelLarge:
      if (weight != null) {
        return Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.labelLarge!;
    case AppTextStyle.labelMedium:
      if (weight != null) {
        return Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.labelMedium!;
    case AppTextStyle.labelSmall:
      if (weight != null) {
        return Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: weight);
      }
      return Theme.of(context).textTheme.labelSmall!;

    case AppTextStyle.headLineLarge:
      return Theme.of(context).textTheme.headlineSmall!;
  }
}
