import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ApplicationLogo extends StatefulWidget {
  const ApplicationLogo({Key? key}) : super(key: key);

  @override
  State<ApplicationLogo> createState() => _ApplicationLogoState();
}

class _ApplicationLogoState extends State<ApplicationLogo> {
  Timer? timer;

  void navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(
      const Duration(seconds: 5),
      () {
        print('遷移完了');
        navigateTo(context, '/choice_cs');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      body: Center(
          child: const Text('ポケっとかーど',
                  style: TextStyle(
                      color: Colors.white, fontSize: 60, fontFamily: 'nicoca'))
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(delay: 10.ms, duration: 3.seconds)
              .shake(hz: 2, curve: Curves.easeInOutCubic)
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.1, 1.1),
                duration: 600.ms,
              )
              .then(delay: 600.ms)
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1 / 1.1, 1 / 1.1),
                duration: 600.ms,
              )),
    );
  }
}
