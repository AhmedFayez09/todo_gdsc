import 'package:flutter/material.dart';

flutterSnackBar({required BuildContext context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: Colors.amber,
    ),
  );
}
