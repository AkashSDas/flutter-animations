import 'package:flutter/material.dart';
import 'package:flutter_animations/animation/prebuilt_implicit_animations/index.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class PreBuiltImplicitAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Pre-built Implicit Animations'),
        body: Container(
          child: ListView(
            children: [
              ExpandingBox(),
              SizedBox(height: 16),
              AlignBox(),
              SizedBox(height: 16),
              CrossFadeBox(),
            ],
          ),
        ),
      );
}
