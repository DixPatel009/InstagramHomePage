import 'package:flutter/material.dart';
import 'package:intagramhome/modules/main/main_screen.dart';
import 'package:intagramhome/utils/navigator.dart';
import 'package:intagramhome/widgets/app_texts.dart';
import 'package:intagramhome/widgets/svg_icon.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    //Redirect After 2 second
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      NavigatorUtils.pushReplace(
        context,
        MainScreen(),
        animationType: AnimationType.fade,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const SvgIcon(
                path: "assets/icons/svg/ic_logo.svg",
                size: 100.0,
              ),
              const Spacer(),
              const NormalText(
                text: "from",
                color: Colors.black54,
                style: AppTextStyle.bodyMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Image.asset(
                "assets/icons/png/ic_meta.png",
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
