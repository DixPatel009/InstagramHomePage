import 'package:flutter/material.dart';
import 'package:intagramhome/widgets/app_texts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NormalText(
          text: "Search Screen",
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
      ),
    );
  }
}
