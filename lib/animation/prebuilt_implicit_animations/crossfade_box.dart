import 'package:flutter/material.dart';

class CrossFadeBox extends StatefulWidget {
  @override
  _CrossFadeBoxState createState() => _CrossFadeBoxState();
}

class _CrossFadeBoxState extends State<CrossFadeBox> {
  bool animated = false;

  /// Update states for animations
  void _updateState() => setState(() => animated = !animated);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildCrossFade(),
            SizedBox(height: 16),
            _buildElevatedButton(),
          ],
        ),
      );

  /// Animated Box
  Widget _buildCrossFade() => AnimatedCrossFade(
        firstChild: _buildFirstChild(),
        secondChild: _buildSecondChild(),
        firstCurve: Curves.easeInOut,
        secondCurve: Curves.easeInOut,
        crossFadeState:
            animated ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300),
        layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
          /// Using Stack and wrapping the childs with AnimatedContainer to avoid
          /// any jump between size of containers which are different in this case
          ///
          /// To animate much more smoothly between sizes we have to use different ways
          /// here I've used AnimatedContainer's and use the `animated` value to change
          /// between sizes. I've to do the same for both the AnimatedContainers
          /// because doing just providing the each on fixed value was leading to both
          /// the containers having the same width and height i.e. 200 and this was creating
          /// cool effect but doing it the way done below will animate between sizes and
          /// opacity
          ///
          /// Other thing to note is that will using AnimatedContainer if only a Container
          /// was used without any width and height explicitly given then it will just
          /// fade between the childs and there will be no animation between width and height
          /// and other thing is that even when the small container will be on screen the
          /// padding or margin around it will make it consume space which the bigger container
          /// was consuming
          ///
          /// Using the combination of height and widht with fixed and toggleable values will
          /// give good results
          return Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                width: animated ? 100 : 200,
                height: animated ? 100 : 200,
                // width: 100,
                // height: 100,
                child: bottomChild,
                key: bottomChildKey,
                duration: Duration(milliseconds: 300),
              ),
              AnimatedContainer(
                width: animated ? 100 : 200,
                height: animated ? 100 : 200,
                // width: 200,
                // height: 200,
                child: topChild,
                key: topChildKey,
                duration: Duration(milliseconds: 300),
              ),
            ],
          );
        },
      );

  /// First Child
  Widget _buildFirstChild() => Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
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

  /// Second Child
  Widget _buildSecondChild() => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
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
