import 'package:flutter/material.dart';
import 'package:flutter_animations/designs/designs.dart';

class Introduction extends StatelessWidget {
  final String title;
  final String description;

  Introduction(this.title, this.description);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                this.title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                this.description,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: DesignSystem.grey2),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
