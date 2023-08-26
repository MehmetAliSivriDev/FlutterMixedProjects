import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_usage/product/constants/lottie_items.dart';
import 'package:lottie_usage/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

class LottieView extends StatefulWidget {
  const LottieView({super.key});

  @override
  State<LottieView> createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Usage"),
        actions: [
          InkWell(
              onTap: () {
                isLight = !isLight;
                controller.animateTo(isLight ? 0 : 0.5);
                context.read<ThemeNotifier>().changeTheme();
              },
              child: Lottie.asset(LottieItems.themeChange.lottiePath,
                  repeat: false, controller: controller))
        ],
      ),
    );
  }
}
