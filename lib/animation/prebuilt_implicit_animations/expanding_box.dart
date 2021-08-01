import 'package:flutter/material.dart';

class ExpandingBox extends StatefulWidget {
  @override
  _ExpandingBoxState createState() => _ExpandingBoxState();
}

class _ExpandingBoxState extends State<ExpandingBox> {
  bool isSmall = true;

  /// Update states for animations
  void _updateState() => setState(() => isSmall = !isSmall);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildAnimatedContainer(),
            SizedBox(height: 16),
            _buildElevatedButton(),
          ],
        ),
      );

  /// Animated Box
  Widget _buildAnimatedContainer() => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: isSmall ? 200 : 300,
        height: isSmall ? 200 : 300,
        decoration: BoxDecoration(
          color: isSmall ? Colors.orange.shade500 : Colors.pink.shade500,
          borderRadius: BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
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
