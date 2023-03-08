import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/text.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(175),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.fromSize(
                  size: const Size.fromHeight(4),
                ),
                const TextWidget(
                  text: 'tes',
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
