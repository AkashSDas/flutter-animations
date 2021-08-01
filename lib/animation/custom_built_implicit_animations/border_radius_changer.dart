import 'package:flutter/material.dart';

class BorderRadiusChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        duration: Duration(seconds: 4),
        tween: Tween<double>(begin: 0, end: 128),
        curve: Curves.easeInOut,
        builder: (context, double radius, child) => Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
        ),
      );
}
