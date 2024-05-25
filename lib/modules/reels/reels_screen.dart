import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/app_texts.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NormalText(
          text: "Reels Screen",
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
      ),
    );
  }
}
