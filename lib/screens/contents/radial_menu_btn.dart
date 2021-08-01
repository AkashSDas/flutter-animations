import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/solo_widgets/radial_menu_btn.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class RadialMenuBtnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Radial Menu Btn'),
        body: Container(child: Center(child: RadialMenu())),
      );
}
