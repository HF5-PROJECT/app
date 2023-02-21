import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key, required this.text, this.maxLines});

  final String text;
  final int? maxLines;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late String text;
  late int? maxLines;

  @override
  void initState() {
    text = widget.text;
    maxLines = widget.maxLines;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const VerticalDivider(
              thickness: 0,
              width: 3,
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromWidth(3),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
