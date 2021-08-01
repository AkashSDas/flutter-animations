import 'package:flutter/material.dart';

class SlideBox extends StatefulWidget {
  @override
  _SlideBoxState createState() => _SlideBoxState();
}

class _SlideBoxState extends State<SlideBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  static final _animation = Tween<Offset>(
    begin: Offset(0, 0),
    end: Offset(8, 0),
  );

  @override
  void initState() {
    _ctrl = AnimationController(
      duration: Duration(seconds: 2),
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

  Widget _buildAnimation() => SlideTransition(
        position: _animation.animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: Curves.easeInOut,
          ),
        ),
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
