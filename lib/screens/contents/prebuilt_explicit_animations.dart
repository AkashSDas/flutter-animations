import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/prebuilt_explicit_animations/index.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class PreBuiltExplicitAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Pre-built Explicit Animations'),
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    RotatingBox(),
                    SizedBox(height: 32),
                    ScalingBox(),
                    SizedBox(height: 32),
                    SlideBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
