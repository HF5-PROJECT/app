import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    super.key,
    this.obscureText = false,
    this.initialValue = '',
    required this.onChanged,
    required this.validator,
    this.hintText = '',
    this.autoFocus = false,
  });

  final bool obscureText;
  final bool autoFocus;
  final String initialValue;
  final void Function(String) onChanged;
  final String hintText;
  final String? Function(String?) validator;

  @override
  State<StatefulWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  late bool obscureText;
  late bool autoFocus;
  late String initialValue;
  late void Function(String) onChanged;
  late String hintText;
  late String? Function(String?) validator;

  @override
  void initState() {
    obscureText = widget.obscureText;
    initialValue = widget.initialValue;
    onChanged = widget.onChanged;
    validator = widget.validator;
    hintText = widget.hintText;
    autoFocus = widget.autoFocus;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      obscureText: obscureText,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        hintText: hintText,
        filled: true,
        isDense: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
