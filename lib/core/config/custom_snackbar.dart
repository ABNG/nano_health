import 'package:flutter/material.dart';
import 'package:nano_health/core/util/extension.dart';

class CustomSnackBar {
  CustomSnackBar.show(BuildContext context, String title,
      {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 1,
        content: Text(
          title,
          style: context.textTheme.labelSmall,
        ),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
