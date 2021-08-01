import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/custom_built_implicit_animations/index.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class CustomBuiltImplicitAnimations extends StatelessWidget {
  /// Tweens are mutable so if you know that you'll use the same tween and
  /// make it a static final variable

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Custom built Implicit Animations'),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    SliderColorChanger(),
                    SizedBox(height: 16),
                    BorderRadiusChanger(),
                    SizedBox(height: 16),
                    GradientOffset(),
                    SizedBox(height: 16),
                    ImageFilter(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
