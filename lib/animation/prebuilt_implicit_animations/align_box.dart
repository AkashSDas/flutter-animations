import 'package:flutter/material.dart';

class AlignBox extends StatefulWidget {
  @override
  _AlignBoxState createState() => _AlignBoxState();
}

class _AlignBoxState extends State<AlignBox> {
  bool animated = true;

  /// Update states for animations
  void _updateState() => setState(() => animated = !animated);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildAnimatedAlign(),
            SizedBox(height: 16),
            _buildElevatedButton(),
          ],
        ),
      );

  /// Animated Box
  Widget _buildAnimatedAlign() => AnimatedAlign(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: animated ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.pink.shade500,
            borderRadius: BorderRadius.all(Radius.circular(32)),
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

  /// Button to toggle animation
  Widget _buildElevatedButton() => ElevatedButton(
        onPressed: () => _updateState(),
        child: Text(
          'Animate',
          style: Theme.of(context).textTheme.headline5,
        ),
      );
}
