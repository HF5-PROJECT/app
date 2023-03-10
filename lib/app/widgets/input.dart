import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    super.key,
    this.obscureText = false,
    this.initialValue = '',
    required this.onChanged,
    required this.validator,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.autoFocus = false,
  });

  final bool obscureText;
  final bool autoFocus;
  final String initialValue;
  final void Function(String) onChanged;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  @override
  State<StatefulWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      obscureText: widget.obscureText,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        hintText: widget.hintText,
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
