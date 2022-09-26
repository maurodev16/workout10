import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

Widget customTimerStart(
  CountDownController? controller,
  int duration,
  void Function()? onComplete,
  void Function()? onStart,
) {
  return NeonCircularTimer(
    controller: controller,
    duration: duration,
    isReverse: true,
    isReverseAnimation: true,
    neon: 3,
    neonColor: Colors.yellow,
    onComplete: onComplete,
    onStart: () {},
    initialDuration: 0,
    textFormat: TextFormat.MM_SS,
    innerFillColor: Colors.white,
    backgroudColor: Color(0xFF2D2F41),
    width: 150,
    strokeWidth: 5,
    strokeCap: StrokeCap.round,
    autoStart: false,
    isTimerTextShown: true,
    neumorphicEffect: true,
    innerFillGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    neonGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    textStyle: TextStyle(
        fontStyle: FontStyle.normal, fontSize: 30, color: Colors.white),
  );
}

///
Widget customTimerPause(
  CountDownController? controller,
  int duration,
  void Function()? onComplete,
  void Function()? onStart,
  bool autoStart,
) {
  return NeonCircularTimer(
    controller: controller,
    duration: duration,
    isReverse: false,
    isReverseAnimation: false,
    neon: 2,
    neonColor: Color.fromARGB(255, 254, 17, 0),
    onComplete: onComplete,
    onStart: () {},
    initialDuration: 0,
    textFormat: TextFormat.MM_SS,
    innerFillColor: Color.fromARGB(255, 202, 58, 58),
    backgroudColor: Color(0xFF2D2F41),
    width: 80,
    strokeWidth: 4,
    strokeCap: StrokeCap.butt,
    outerStrokeColor: Colors.white,
    autoStart: autoStart,
    isTimerTextShown: true,
    neumorphicEffect: true,
    innerFillGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    neonGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    textStyle: TextStyle(
        fontStyle: FontStyle.normal, fontSize: 10, color: Colors.white),
  );
}

Widget customTimerCountdown(
  CountDownController? controller,
  int duration,
  void Function()? onComplete,
  void Function()? onStart,
) {
  return NeonCircularTimer(
    controller: controller,
    duration: duration,
    isReverse: false,
    isReverseAnimation: false,
    neon: 1,
    neonColor: Color.fromARGB(255, 255, 154, 2),
    onComplete: onComplete,
    onStart: () {},
    initialDuration: 0,
    textFormat: TextFormat.MM_SS,
    innerFillColor: Colors.white,
    backgroudColor: Color(0xFF2D2F41),
    width: 100,
    autoStart: false,
    isTimerTextShown: true,
    neumorphicEffect: true,
    innerFillGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    neonGradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 187, 253),
      Color.fromARGB(255, 0, 93, 254)
    ]),
    textStyle: TextStyle(
        fontStyle: FontStyle.normal, fontSize: 30, color: Colors.white),
  );
}
