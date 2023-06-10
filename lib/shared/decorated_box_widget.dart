import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatelessWidget {
  final double radius;
  final Widget child;
  const DecoratedBoxWidget(
      {Key? key, required this.radius, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
