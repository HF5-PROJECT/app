import 'package:flutter/material.dart';

class DropdownInputWidget extends StatefulWidget {
  const DropdownInputWidget({
    super.key,
    this.initialValue = '',
    required this.onChanged,
    required this.items,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.autoFocus = false,
  });

  final bool autoFocus;
  final String initialValue;
  final void Function(dynamic) onChanged;
  final String hintText;
  final TextInputType keyboardType;
  final List<DropdownMenuItem<int>> items;

  @override
  State<StatefulWidget> createState() => _DropdownInputWidgetState();
}

class _DropdownInputWidgetState extends State<DropdownInputWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      autofocus: widget.autoFocus,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onChanged: widget.onChanged,
      items: widget.items,
      iconEnabledColor: Theme.of(context).colorScheme.secondary,
      dropdownColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        hintText: widget.hintText,
        filled: true,
        isDense: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        suffixIconColor: Theme.of(context).colorScheme.secondary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
