import 'package:flutter/material.dart';
import 'package:overnites/app/factories/auth_service_factory.dart';
import 'package:overnites/app/util/modal.dart';
import 'package:overnites/auth/widgets/login.dart';
import 'package:overnites/booking/factory.dart';
import 'package:overnites/booking/widgets/room_booking_criterias.dart';
import 'package:overnites/hotel/model.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/room/type/factory.dart';
import 'package:overnites/room/type/model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HotelBookPage extends StatefulWidget {
  const HotelBookPage({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<HotelBookPage> createState() => _HotelBookPageState();
}

class BookState {
  BookState() {
    _instance.roomTypeIds = [];
    _instance.start = null;
    _instance.end = null;
  }
  BookState._internal();

  static final BookState _instance = BookState._internal();

  List<BookRoomType> roomTypeIds = [];
  DateTime? start;
  DateTime? end;

  void removeRoomTypeIfSet(ValueKey<String> key) {
    if (roomTypeIds.any(
      (e) => e.roomTypeKey == key,
    )) {
      roomTypeIds.removeWhere(
        (e) => e.roomTypeKey == key,
      );
    }
  }
}

class BookRoomType {
  BookRoomType(ValueKey<String> key, int id) {
    roomTypeKey = key;
    roomTypeId = id;
  }

  late ValueKey<String> roomTypeKey;
  late int roomTypeId;
}

class _HotelBookPageState extends State<HotelBookPage> {
  List<RoomType> roomTypes = <RoomType>[];
  List<Widget> selectedRooms = <Widget>[];

  Future<void> getRoomTypesByHotelId() async {
    final roomTypeService = await RoomTypeServiceFactory.make();

    roomTypes = await roomTypeService.getByHotelId(widget.hotel.id);
  }

  final _bookState = BookState();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

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

        if (widgets.isEmpty) {
          widgets.add(
            Text(
              context.l10n.noResultsTryRefreshing,
            ),
          );
        }

        if (selectedRooms.isEmpty) {
          final roomKey = ValueKey(DateTime.now().toString());
          selectedRooms.add(
            RoomBookCriteria(
              roomTypeList: roomTypes,
              removable: false,
              onDelete: () {},
              onChange: (value) => {
                setState(
                  () {
                    _bookState.removeRoomTypeIfSet(roomKey);

                    _bookState.roomTypeIds.add(
                      BookRoomType(roomKey, value as int),
                    );
                  },
                )
              },
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.fromLTRB(35, 50, 35, 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      context.l10n.booking,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      context.l10n.chooseCriterias,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    SfDateRangePicker(
                      minDate: DateTime.now(),
                      monthFormat: 'MMM',
                      selectionMode: DateRangePickerSelectionMode.range,
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {
                        final ranges = args.value as PickerDateRange;

                        setState(() {
                          _bookState
                            ..start = ranges.startDate
                            ..end = ranges.endDate;
                        });
                      },
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      monthViewSettings: const DateRangePickerMonthViewSettings(
                        firstDayOfWeek: 1,
                      ),
                      yearCellStyle: DateRangePickerYearCellStyle(
                        todayTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      rangeSelectionColor:
                          Theme.of(context).colorScheme.secondary,
                      todayHighlightColor:
                          Theme.of(context).colorScheme.onPrimary,
                    ),
                    ...selectedRooms,
                    Container(
                      margin: const EdgeInsets.only(top: 43, bottom: 16),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                final roomKey =
                                    ValueKey(DateTime.now().toString());
                                selectedRooms.add(
                                  RoomBookCriteria(
                                    key: roomKey,
                                    roomTypeList: roomTypes,
                                    onDelete: () {
                                      setState(() {
                                        selectedRooms.removeWhere(
                                          (element) => element.key == roomKey,
                                        );

                                        _bookState.removeRoomTypeIfSet(roomKey);
                                      });
                                    },
                                    onChange: (value) => {
                                      setState(
                                        () {
                                          _bookState
                                              .removeRoomTypeIfSet(roomKey);

                                          _bookState.roomTypeIds.add(
                                            BookRoomType(roomKey, value as int),
                                          );
                                        },
                                      )
                                    },
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              minimumSize: const Size.fromHeight(40),
                            ),
                            child: Text(
                              context.l10n.addRoom,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 33),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final navigator = Navigator.of(context);
                              final ctx = context;
                              setState(() {
                                errorMessage = '';
                              });

                              if (await (await AuthServiceFactory.make())
                                  .isAuthenticated()) {
                                if (_bookState.start == null ||
                                    _bookState.end == null) {
                                  setState(() {
                                    errorMessage = 'You need to pick a date';
                                  });
                                  return;
                                } else if (_bookState.roomTypeIds.isEmpty) {
                                  setState(() {
                                    errorMessage =
                                        'You need to pick minimum 1 room type '
                                        "you'd like to book";
                                  });
                                  return;
                                }

                                if (await (await BookingServiceFactory.make())
                                    .book(
                                  _bookState.start!,
                                  _bookState.end!,
                                  _bookState.roomTypeIds,
                                )) {
                                  navigator.pop();
                                }
                              } else {
                                // ignore: use_build_context_synchronously
                                showModal(
                                  ctx,
                                  (ctx) {
                                    return const LoginWidget();
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              minimumSize: const Size.fromHeight(40),
                            ),
                            child: Text(
                              context.l10n.book,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (errorMessage.isNotEmpty)
                            Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Color(0xFFC06172),
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
