import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/app_texts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NormalText(
          text: "Profile Screen",
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
      ),
    );
  }
}
