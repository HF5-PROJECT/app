import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showModal(
  BuildContext context,
  Widget Function(BuildContext) builder,
) {
  // ignore: inference_failure_on_function_invocation
  showMaterialModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.surface,
    builder: builder,
  );
}
