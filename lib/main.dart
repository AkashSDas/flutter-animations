import 'package:flutter/material.dart';
import 'package:flutter_animations/designs/designs.dart';
import 'package:flutter_animations/screens/contents/index.dart';
import 'package:flutter_animations/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Animations',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: DesignSystem.grey1,
          accentColor: DesignSystem.grey0,
          textTheme: DesignSystem.textTheme,
        ),

        /// Routes
        routes: _getRoutes(context),
      );

  Map<String, Widget Function(BuildContext)> _getRoutes(BuildContext context) {
    return {
      '/': (context) => HomeScreen(),

      /// Content Screens
      '/background-color-changing': (context) => BgColorChanging(),
      '/text-grow': (context) => TextGrow(),
      '/implicit/pre-built': (context) => PreBuiltImplicitAnimations(),
      '/implicit/custom-built': (context) => CustomBuiltImplicitAnimations(),
      '/explicit/pre-built': (context) => PreBuiltExplicitAnimations(),
      '/explicit/custom-built': (context) => CustomExplicitAnimations(),
      '/basic-blocks-of-animations': (context) => BasicBlocksOfAnimations(),
      '/radial-menu-btn': (context) => RadialMenuBtnScreen(),
      '/flare/bottom-nav': (context) => FlareBottomNav(),
    };
  }
}
