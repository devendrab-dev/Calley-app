import 'package:flutter/material.dart';

void message(BuildContext context, String message, bool error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      shape: BeveledRectangleBorder(),
      backgroundColor: error ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 3),
      showCloseIcon: true,
    ),
  );
}
