import 'package:flutter/material.dart';

void showSnackbarMessage(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(title), duration: Duration(seconds: 2)),
  );
}
