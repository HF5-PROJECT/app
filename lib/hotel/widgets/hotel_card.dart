import 'package:flutter/material.dart';
import 'package:overnites/app/util/modal.dart';
import 'package:overnites/app/widgets/text.dart';
import 'package:overnites/booking/view/hotel_room_booking.dart';
import 'package:overnites/hotel/model.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/room/type/view/hotel_room_types.dart';

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder<HotelRoomTypesPage>(
                        pageBuilder: (context, animation1, animation2) =>
                            HotelRoomTypesPage(hotel: widget.hotel),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: Text(
                    context.l10n.rooms,
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
                  onPressed: () {
                    showModal(
                      context,
                      (context) {
                        return HotelBookPage(hotel: widget.hotel);
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: Text(
                    context.l10n.book,
                    style: const TextStyle(
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
