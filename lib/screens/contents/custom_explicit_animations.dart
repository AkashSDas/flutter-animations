import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/custom_implicit_animations/index.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class CustomExplicitAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Custom Explicit Animation'),
        body: Container(
          child: ListView(
            children: [RadialTransition()],
          ),
        ),
      );
}
