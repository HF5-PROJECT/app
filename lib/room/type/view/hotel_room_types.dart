import 'dart:math';

import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/header.dart';
import 'package:overnites/hotel/model.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/room/type/factory.dart';
import 'package:overnites/room/type/model.dart';
import 'package:overnites/room/type/widgets/types_card.dart';

class HotelRoomTypesPage extends StatefulWidget {
  const HotelRoomTypesPage({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<HotelRoomTypesPage> createState() => _HotelRoomTypesPageState();
}

class _HotelRoomTypesPageState extends State<HotelRoomTypesPage> {
  List<RoomType> roomTypes = <RoomType>[];

  Future<void> getRoomTypesByHotelId() async {
    final roomTypeService = await RoomTypeServiceFactory.make();

    roomTypes = await roomTypeService.getByHotelId(widget.hotel.id);
  }

  Future<void> refreshRoomTypes() async {
    final roomTypeService = await RoomTypeServiceFactory.make();

    final roomTypes = await roomTypeService.getByHotelId(widget.hotel.id);
    setState(() {
      this.roomTypes = roomTypes;
    });
  }

  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRoomTypesByHotelId(),
      builder: (context, snapshot) {
        final widgets = <Widget>[];

        if (roomTypes.isEmpty) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const HeaderWidget(),
                  if (snapshot.hasError)
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
        }

        for (final roomType in roomTypes) {
          widgets.add(RoomTypeCard(roomType: roomType));
        }

        if (widgets.isEmpty) {
          widgets.add(
            Text(
              context.l10n.noResultsTryRefreshing,
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HeaderWidget(
                  key: key,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return RefreshIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                        onRefresh: refreshRoomTypes,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: max(
                                0,
                                constraints.maxHeight -
                                    (key.currentContext!.findRenderObject()!
                                            as RenderBox)
                                        .size
                                        .height,
                              ),
                              minWidth: constraints.maxWidth,
                            ),
                            child: Wrap(
                              runSpacing: 40,
                              children: widgets,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
