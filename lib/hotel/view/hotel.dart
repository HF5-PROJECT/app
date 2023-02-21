import 'dart:math';

import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/header.dart';
import 'package:overnites/hotel/factory.dart';
import 'package:overnites/hotel/model.dart';
import 'package:overnites/hotel/widgets/hotel_card.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  Future<List<Hotel>> getHotels() async {
    final hotelService = await HotelServiceFactory.make();

    return hotelService.getHotels();
  }

  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHotels(),
      builder: (context, snapshot) {
        final widgets = <Widget>[];

        if (!snapshot.hasData) {
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

        for (final hotel in snapshot.data!) {
          widgets.add(HotelCard(hotel: hotel));
        }

        if (widgets.isEmpty) {
          widgets.add(
            const Text(
              'Der er ingen hoteller, prøv at refresh...',
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
                        onRefresh: () async => setState(() {}),
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
