import 'package:flutter/material.dart';

class ImageFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        tween: ColorTween(begin: Colors.yellow, end: Colors.indigo),
        duration: Duration(seconds: 8),
        curve: Curves.easeInOut,
        builder: (context, color, child) => ColorFiltered(
          colorFilter: ColorFilter.mode(color as Color, BlendMode.modulate),
          child: child,
        ),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              ),
            ),
          ),
        ),
      );
}
