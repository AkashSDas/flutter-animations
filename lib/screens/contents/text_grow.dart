import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class TextGrow extends StatelessWidget {
  /// Tween Animations
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 10);
  final ColorTween _colorTween = ColorTween(
    begin: Colors.red,
    end: Colors.blue,
  );
  final SizeTween _sizeTween = SizeTween(begin: Size(0, 0), end: Size(10, 10));
  final AlignmentTween _alignmentTween = AlignmentTween(
    begin: Alignment.center,
    end: Alignment.topRight,
  );

  Widget _buildBody(BuildContext context) => Center(
        child: TweenAnimationBuilder(
          tween: _scaleTween,
          duration: Duration(seconds: 5),
          builder: (context, double scale, child) => Transform.scale(
            scale: scale,
            child: child,
          ),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purple,
            child: Center(
              child: Text(
                'Hello World',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Background Color Changing'),
        body: _buildBody(context),
      );
}
