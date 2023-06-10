import 'package:flutter/material.dart';

class ActionIconContainer extends StatelessWidget {
  final VoidCallback onPress;
  final IconData iconData;
  const ActionIconContainer(
      {Key? key, required this.onPress, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(iconData),
        onPressed: onPress,
      ),
    );
  }
}
