import 'package:flutter/material.dart';

class GradientOffset extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
        tween: Tween<Offset>(begin: Offset(4, 4), end: Offset(15, 25)),
        builder: (context, Offset offset, child) => Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade200,
                Colors.purple.shade300,
                Colors.purple.shade400,
              ],
              stops: [0.25, 0.65, 0.95],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade200,
                blurRadius: 32,
                offset: offset,
              ),
            ],
          ),
        ),
      );
}
