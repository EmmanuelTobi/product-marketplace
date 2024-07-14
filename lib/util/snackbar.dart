import 'package:flutter/material.dart';
import 'package:marketplace/util/colors.dart';

void showSnackBar({
  String? message = 'An error occured',
  String? label = 'DISMISS',
  Function? onPressed,
  BuildContext? context,
  bool? error = false,
  int? duration,
}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    backgroundColor: error == false ? XColors.primaryColor() : Colors.red,
    content: Text(
      message == null
          ? 'An error occurred'
          : message.isNotEmpty
          ? message
          : 'An error occurred',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
    duration: Duration(seconds: duration ?? 5),
    action: SnackBarAction(
      label: label!,
      textColor: Colors.white,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        } else {
          onPressed;
        }
      },
    ),
  ));
}
