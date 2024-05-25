import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/app_texts.dart';

class AddPostScreeen extends StatelessWidget {
  const AddPostScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NormalText(
          text: "Add Post Screen",
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
      ),
    );
  }
}
