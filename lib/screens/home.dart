import 'package:flutter/material.dart';
import 'package:flutter_animations/dummy_data.dart';
import 'package:flutter_animations/widgets/introduction.dart';
import 'package:flutter_animations/widgets/topic_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: ListView(
            children: [
              Introduction(
                'Animations',
                'Amazing animations using Flutter\'s builtin tools and Flare. Also using custom widgets.',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding: EdgeInsets.only(left: 16),
                  //   child: Text(
                  //     'Simple Animations',
                  //     style: Theme.of(context).textTheme.headline4,
                  //   ),
                  // ),
                  _buildDivider(context),
                  ..._buildTopicCards(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildDivider(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Container(
          child: Divider(),
          width: MediaQuery.of(context).size.width * 0.9,
        ),
      );

  List<Column> _buildTopicCards() => DummyData.topics
      .map(
        (topic) => Column(
          children: [
            SizedBox(height: 8),
            Align(
              child: TopicCard(
                topic.title,
                topic.description,
                topic.routeName,
              ),
            ),
          ],
        ),
      )
      .toList();
}
