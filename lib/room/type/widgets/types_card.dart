import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/text.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/room/type/model.dart';

class RoomTypeCard extends StatefulWidget {
  const RoomTypeCard({super.key, required this.roomType});

  final RoomType roomType;

  @override
  State<RoomTypeCard> createState() => _RoomTypeCardState();
}

class _RoomTypeCardState extends State<RoomTypeCard> {
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
                Text(
                  widget.roomType.name,
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(4),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: widget.roomType.description,
                        maxLines: 3,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextWidget(
                            text: context.l10n.size + widget.roomType.size,
                            maxLines: 1,
                          ),
                          TextWidget(
                            text: context.l10n.supportedPeople +
                                widget.roomType.supportedPeople.toString(),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(12),
                ),
                TextWidget(
                  text: context.l10n.price +
                      widget.roomType.price.toString() +
                      context.l10n.kr,
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
