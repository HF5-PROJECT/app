import 'package:flutter/material.dart';

void showSnackBar(
  ScaffoldMessengerState scaffoldMessengerState,
  Widget content,
) {
  scaffoldMessengerState.showSnackBar(
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
