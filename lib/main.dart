import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/screens.dart';

import 'screens/radial_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,

      // Routes
      routes: {
        '/': (context) => HomeScreen(),
        '/animated_container': (context) => MyAnimatedContainer(),
        '/tween_animation': (context) => MyTweenAnimation(),
        '/background_changing': (context) => BackgroundChangingScreen(),
        '/animation_controller': (context) => MyAnimationController(),
        '/radial_menu': (context) => RadialMenu(),
        '/flare_animation': (context) => FlareAnimation(),
      },
    );
  }
}
