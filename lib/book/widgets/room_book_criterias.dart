import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/dropdown.dart';
import 'package:overnites/room/type/model.dart';

class RoomBookCriteria extends StatefulWidget {
  const RoomBookCriteria({
    super.key,
    required this.roomTypeList,
    this.removable = true,
    required this.onDelete,
    required this.onChange,
  });

  final List<RoomType> roomTypeList;
  final bool removable;
  final void Function() onDelete;
  final void Function(dynamic) onChange;

  @override
  State<RoomBookCriteria> createState() => _RoomBookCriteriaState();
}

class _RoomBookCriteriaState extends State<RoomBookCriteria> {
  final List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    if (widget.removable) {
      widgets.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ElevatedButton(
              onPressed: widget.onDelete,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size.fromHeight(40),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                textAlign: TextAlign.start,
                '-',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownInputWidget(
                  hintText: 'Choose a room type',
                  items: widget.roomTypeList.map((value) {
                    return DropdownMenuItem(
                      value: value.id,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: widget.onChange,
                ),
              ),
            ),
          ),
          ...widgets
        ],
      ),
    );
  }
}
