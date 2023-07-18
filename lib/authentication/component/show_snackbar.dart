import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String texto,
  bool isError = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
