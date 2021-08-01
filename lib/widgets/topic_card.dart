import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final String description;
  final String navigateTo; // route name

  TopicCard(this.title, this.description, this.navigateTo);

  /// Solution of InkWell not showing Ripple Effect
  /// stackoverflow post => https://stackoverflow.com/questions/45424621/inkwell-not-showing-ripple-effect
  /// Also to add box-shadow, add it to the outer container AND to add color and border-radius
  /// add that to the Material widget ALSO keep the color of the inner container transparent
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, navigateTo),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: _buildCardInnerContainer(context),
          ),
        ),
      );

  Widget _buildCardInnerContainer(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.title, style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 8),
            Text(
              this.description,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      );
}
