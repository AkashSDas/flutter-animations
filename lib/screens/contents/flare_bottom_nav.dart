import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/flare/bottom_nav.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class FlareBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Flare Bottom Nav'),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: FlareNavbar(),
        ),
      );
}
