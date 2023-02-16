import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  Widget content,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
    ),
  );
}
