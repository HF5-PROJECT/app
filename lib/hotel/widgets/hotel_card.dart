import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/text.dart';
import 'package:overnites/hotel/model.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
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
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.name,
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
                TextWidget(
                  text: widget.hotel.description,
                  maxLines: 2,
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(4),
                ),
                TextWidget(
                  text: widget.hotel.address,
                  maxLines: 1,
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: Text(
                    'Værelser',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: const Text(
                    'Book',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
