
import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/svg_icon.dart';

class BottomMenuItem extends StatelessWidget {
  final String? icon;
  final VoidCallback onTap;
  final bool isSelected;

  const BottomMenuItem({
    required this.icon,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: SvgIcon(
          path: icon ?? "",
          size: 24,
          color: isSelected ? Colors.blueAccent : null,
        ),
      ),
    );
  }
}
