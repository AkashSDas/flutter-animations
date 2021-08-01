import 'package:flutter/material.dart';

class ScalingBox extends StatefulWidget {
  @override
  _ScalingBoxState createState() => _ScalingBoxState();
}

class _ScalingBoxState extends State<ScalingBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    _ctrl = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAnimation(),
          SizedBox(height: 16),
          _buildBtn(),
        ],
      ),
    );
  }

  Widget _buildAnimation() => ScaleTransition(
        scale: _ctrl,
        child: _buildContainer(),
      );

  Widget _buildContainer() => Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.shade200,
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
      );

  Widget _buildBtn() => ElevatedButton(
        onPressed: () {
          if (!_ctrl.isAnimating) {
            _ctrl.repeat();
          } else {
            _ctrl.stop();
          }
        },
        child: Text(
          'Animate',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
}
