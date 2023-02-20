import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key, required this.text});

  final String text;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late String text;

  @override
  void initState() {
    text = widget.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 3,
          height: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
