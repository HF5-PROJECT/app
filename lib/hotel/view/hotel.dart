import 'dart:math';

import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/header.dart';
import 'package:overnites/hotel/factory.dart';
import 'package:overnites/hotel/model.dart';
import 'package:overnites/hotel/widgets/hotel_card.dart';
import 'package:overnites/l10n/l10n.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  List<Hotel> hotels = <Hotel>[];

  Future<void> getHotels() async {
    final hotelService = await HotelServiceFactory.make();

    hotels = await hotelService.getHotels();
  }

  Future<void> refreshHotels() async {
    final hotelService = await HotelServiceFactory.make();

    final hotels = await hotelService.getHotels();
    setState(() {
      this.hotels = hotels;
    });
  }

  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHotels(),
      builder: (context, snapshot) {
        final widgets = <Widget>[];

        if (hotels.isEmpty) {
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

        for (final hotel in hotels) {
          widgets.add(HotelCard(hotel: hotel));
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
                        onRefresh: refreshHotels,
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
