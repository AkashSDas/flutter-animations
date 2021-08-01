import 'package:flutter/material.dart';

class DocumentationText extends StatelessWidget {
  final text;

  DocumentationText(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      );
}
