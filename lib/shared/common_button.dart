import 'package:flutter/material.dart';
import 'package:nano_health/core/util/extension.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double height;
  final double borderRadius;
  const CommonButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.height = 74.0,
      this.borderRadius = 62})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: context.textTheme.displayMedium,
      ),
    );
  }
}
